import { registerUser, requestRefreshToken, userLogout } from "../controllers/authControllers.js";
import { loginUser } from "../controllers/authControllers.js";
import { Router } from "express";
import { verifyToken } from "../controllers/middlewareController.js";
const router = Router();
// register
router.post("/register", registerUser);
// login
router.post("/login", loginUser);
// refresh
router.post("/refresh", requestRefreshToken);
//logout
router.post("/logout", verifyToken, userLogout);
export default router;