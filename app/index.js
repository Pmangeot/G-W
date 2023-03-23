const express = require("express");
const app = express();
require('dotenv').config();
const session = require('express-session');
const path = require('path');

const gwlist = require('../app/data/gwlist.json');

const PORT = process.env.PORT;

const routers = require('./routers');

app.use(express.urlencoded({ extended: true }));

app.use(
    session({
        saveUninitialized: true,
        resave: true,
        secret: 'Un secret pour signer les id de sessions',
    })
);

app.use(express.static('assets'));

app.set('view engine', 'ejs');
app.set('views', './app/views');


app.use(routers);


app.use((req, res, next) => {
    res.status(404).render('erreur');
});

app.listen(PORT, ()=>{
    console.log(`Serveur lancé sur http://localhost:${PORT}`);
});