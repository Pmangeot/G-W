const express = require("express");
const collectionController = require("../controllers/collection");

const router = express.Router();

router.get("/collection", collectionController.list);

module.exports = router;
