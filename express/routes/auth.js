import { registerUser } from "../controllers/authControllers.js";

const router = require("express").Router();

router.post("/register", registerUser);

export default router;