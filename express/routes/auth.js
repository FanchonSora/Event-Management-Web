import { registerUser } from "../controllers/authControllers.js";
import { loginUser } from "../controllers/authControllers.js";
import { Router } from "express";
const router = Router();
// register
router.post("/register", registerUser);
// login
router.post("/login", loginUser);
export default router;