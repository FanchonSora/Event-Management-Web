import { verifyToken, verifyTokenAndAdminAuth } from "../controllers/middlewareController.js";
import { getAllUsers, deleteUser } from "../controllers/userController.js";
import { Router } from "express";
const router = Router();

// get all users
router.get("/", verifyToken, getAllUsers);

// delete user information
router.delete("/:id", verifyTokenAndAdminAuth, deleteUser);

export default router;