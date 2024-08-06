import { getAllUsers, deleteUser } from "../controllers/userController.js";
import { Router } from "express";
const router = Router();

// get all users
router.get("/", getAllUsers);

// delete user information
router.delete("/:id", deleteUser);

export default router;