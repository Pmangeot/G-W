const express = require("express");
const collectionController = require("../controllers/collection");

const router = express.Router();

router.get("/collection", (req, res)=>{res.redirect("/collection/series");});
router.get("/collection/series", collectionController.listBySeries);

//router.get("/collection/date", collectionController.listByDate);

//router.get("/collection/scarcity", collectionController.listByScarcity);

module.exports = router;
