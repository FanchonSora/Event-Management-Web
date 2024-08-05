import User from "../models/User.js";
import { genSalt, hash } from "bcrypt";

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

export const loginUser = async(req, res) => {
    try {
        const user = await User.findOne({username: req.body.username});
        if(!user) {
            res.status(404).json("Wrong username!");
        }
        const validPassword = await bcrypt.compare(
            req.body.password,
            user.password
        );
        if(!validPassword) {
            res.status(404).json("Wrong password");
        }
        if(user && validPassword) {
            res.status(202).json(user);
        }
    }catch(err) {
        res.status(500).json(err);
    }
}
