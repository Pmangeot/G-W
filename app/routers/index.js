const express = require('express');
const accueilRouter = require("./accueil");
const unitsRouter = require("./units");
const collectionsRouter = require("./collections");
const routers = express.Router();

//initialisation des routers separes
routers.use(collectionsRouter);
routers.use(unitsRouter);
routers.use(accueilRouter);

// export du router principal
module.exports = routers;






