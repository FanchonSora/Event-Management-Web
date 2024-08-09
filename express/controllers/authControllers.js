import User from "../models/User.js";
import { genSalt, hash, compare } from "bcrypt";
import jwt from "jsonwebtoken";

class Response {
    constructor(message, success) {
        this.message = message;
        this.success = success;
    }
}

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
            res.status(404).json(new Response("User not found", false));
            return;
        }
        const validPassword = compare(
            req.body.password,
            user.password
        );
        if(!validPassword) {
            res.status(404).json(new Response("Wrong password", false));
            return;
        }
        if(user && validPassword) {
            // await promises
            const accessToken = await generateAccessToken(user);
            const refreshToken = await generateRefreshToken(user);
             
            refreshTokens.push(refreshToken);
            res.cookie("refreshToken", refreshToken, {
                httpOnly: true,
                secure: false,
                path: "/",
                sameSite: "strict",
            })
            const {password, ...others} = user._doc;
            res.status(202).json({...others, accessToken, ...new Response("Login successfully", true)});
        }
    }catch(err) {
        console.log(err);
        res.status(500).json(err);
    }
}

export const requestRefreshToken = async(req, res) => {
    const refreshToken = req.cookie.refreshToken;
    if(!refreshToken) {
        return res.status(401).json(new Response("You are not authenticated", false));
    }
    if(!refreshTokens.includes(refreshToken)) {
        return res.status(403).json(new Response("Refresh token is not valid", false));
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

export const userLogout = async(req, res) => {
    res.clearCookie("refreshToken");
    refreshTokens = refreshTokens.filter(token => token !== req.cookies.refreshToken);
    res.status(200).json("Log out successfully");
}
