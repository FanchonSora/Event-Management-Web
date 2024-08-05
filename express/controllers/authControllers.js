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