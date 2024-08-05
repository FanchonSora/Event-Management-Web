import express, { json } from "express";
import cors from "cors";
import { config } from "dotenv";
import { connect } from "mongoose";
import cookieParser from "cookie-parser";
import authRoute from "./routes/auth.js";

config();
const app = express();

connect(process.env.MONGODB_URL)
.then(() => console.log("Connected to MongoDB"))
.catch(err => {
    console.log(err, "lỗi r")
})

app.use(cors());
app.use(cookieParser());
app.use(json());

// routes
app.use("/v1/auth", authRoute);


app.listen(8000, () => {
    console.log("Server is running");
});

// authentication
// authorization
