import User from "../models/User.js";
import { genSalt, hash, compare } from "bcrypt";
import jwt from "jsonwebtoken";

let refreshTokens = [];
export const registerUser = async (req, res) => {
    try{
        // Hashed user password 
        const salt = await genSalt(10);
        const hashed = await hash(req.body.password, salt);

        // Create new user information
        const newUser = new User({
            username: req.body.username,
            email: req.body.email,
            password: hashed,
        });

        // Save infor to database
        const user = await newUser.save();
        res.status(200).json(user);
    } catch(err) {
        res.status(404).json(err);
    }
}

export const generateAccessToken = async(user) => {
    return jwt.sign({
        id: user.id,
        admin: user.admin,
    }, process.env.JWT_ACCESS_KEY, {expiresIn: "2d"}); 
}

export const generateRefreshToken = async(user) => {
    return jwt.sign({
        id: user.id,
        admin: user.admin,
    }, process.env.JWT_REFRESH_KEY, {expiresIn: "365d"});
}

export const loginUser = async(req, res) => {
    try {

        console.log(req.body)
        const user = await User.findOne({username: req.body.username});
        if(!user) {
            res.status(404).json("Wrong username!");
            return;
        }
        const validPassword = compare(
            req.body.password,
            user.password
        );
        if(!validPassword) {
            res.status(404).json("Wrong password");
            return;
        }
        if(user && validPassword) {
            const accessToken = generateAccessToken(user);
            const refreshToken = generateRefreshToken(user); 
            refreshTokens.push(refreshToken);
            res.cookie("refreshToken", refreshToken, {
                httpOnly: true,
                secure: false,
                path: "/",
                sameSite: "strict",
            })
            const {password, ...others} = user._doc;
            res.status(202).json({...others, accessToken});
        }
    }catch(err) {
        console.log(err);
        res.status(500).json(err);
    }
}

export const requestRefreshToken = async(req, res) => {
    const refreshToken = req.cookie.refreshToken;
    if(!refreshToken) {
        return res.status(401).json("You're not authenticated");
    }
    if(!refreshTokens.includes(refreshToken)) {
        return res.status(403).json("Refresh token is not valid");
    }
    jwt.verify(refreshToken, process.env.JWT.JWT_REFRESH_KEY, (err, user) => {
        if(err) {
            console.log(err);
        }
        refreshTokens = refreshTokens.filter((token) => token !== refreshToken);
        const newAccessToken = generateAccessToken(user);
        const newRefreshToken = generateAccessToken(user);
        refreshTokens.push(newRefreshToken);
        res.cookie("refreshToken", newRefreshToken, {
            httpOnly: true,
            secure: false,
            path: "/",
            sameSite: "strict",
        })
        res.status(200).json({accessToken: newAccessToken});
    })
}
