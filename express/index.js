import express, { json } from "express";
import cors from "cors";
import { config } from "dotenv";
import { connect } from "mongoose";
import cookieParser from "cookie-parser";
import authRoute from "./routes/auth.js";
import userRoute from "./routes/user.js";

config();
const app = express();

connect(process.env.MONGODB_URL)
.then(() => console.log("Connected to MongoDB"))

app.use(cors());
app.use(cookieParser());
app.use(json());

// routes
app.use("/v1/auth", authRoute);
app.use("/v1/auth", userRoute);

app.listen(8000, () => {
    console.log("Server is running at http://localhost:8000");
});

// authentication
// authorization
