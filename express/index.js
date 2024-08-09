import express, { json } from "express";
import cors from "cors";
import { config } from "dotenv";
import { connect } from "mongoose";
import cookieParser from "cookie-parser";
import authRoute from "./routes/auth.js";
import userRoute from "./routes/user.js";
import http from "http";
import io from "./listeners/socketManager.js";

config();
const app = express();

connect(process.env.MONGODB_URL)
.then(() => console.log("Connected to MongoDB"))

const corsOptions = {
}

app.use(cors(corsOptions));
app.use(cookieParser());
app.use(json());
const server = http.createServer(app)

io.attach(server, { cors: corsOptions });

// routes
app.use("/v1/auth", authRoute);
app.use("/v1/user", userRoute);

server.listen(8000, () => {
    console.log("Server running on port 8000");
});

// authentication
// authorization
