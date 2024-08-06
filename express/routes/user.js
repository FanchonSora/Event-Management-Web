import { getAllUsers } from "../controllers/userController.js";
import { Router } from "express";
const router = Router();

// get all users
router.get("/", getAllUsers)

export default router;