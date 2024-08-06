import { getAllUsers } from "../controllers/userController";

const router = require("express").Router();

// get all users
router.get("/", getAllUsers)

export default router;