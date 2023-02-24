//require de express qui contient la method router et creation du router
const express = require("express");
const router = express.Router();

//Page d'accueil simple sans controller ni rien d'autre
router.get('/', (req, res)=>{
    res.render('accueil');
});

//export du router pour ce middleware accueil
module.exports = router;