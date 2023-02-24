const express = require("express");
const unitController = require("../controllers/unit");

const router = express.Router();

router.get("/modele/:modelName", unitController.details);

module.exports = router;