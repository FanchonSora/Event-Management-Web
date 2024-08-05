import express, { json } from "express";
import cors from "cors";
import { config } from "dotenv";
import { connect } from "mongoose";
import cookieParser from "cookie-parser";

config();
const app = express();

connect(process.env.MONGODB_URL)

app.use(cors());
app.use(cookieParser());
app.use(json());

app.listen(8000, () => {
    console.log("Server is running");
});