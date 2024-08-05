import { Schema, model } from "mongoose";

const userSchema = new Schema({
    username:{
        type: String, 
        require: true,
        minlength: 5,
        maxlength: 25,
        unique: true
    }, 
    email:{
        type: String, 
        require: true,
        minlength: 10,
        maxlength: 60,
        unique: true
    },
    password:{
        type: String, 
        require: true,
        minlength: 5
    },
    admin:{
        type: Boolean,
        default:false
    }
}, {timestamps: true}
)

export default model("User", userSchema);