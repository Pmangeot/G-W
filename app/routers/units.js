const express = require("express");
const unitController = require("../controllers/unit");

const router = express.Router();

router.get("/modele/:modelId", unitController.details);

module.exports = router;