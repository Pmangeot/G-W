const express = require("express");
const app = express();

const gwlist = require('./data/gwlist.json');

require('dotenv').config();
const PORT = process.env.PORT;

const routers = require('./routers');



app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(express.static('public'));

app.locals.gwlist = gwlist;

app.get('/', (req, res)=>{
    res.render('accueil');
});

app.get('/collection', (req, res)=>{
    res.render('collection');
});

app.get('/modele/:modelName', (req, res)=>{

    const modelName = req.params.modelName;

    const foundModel = gwlist.find((model)=>{
        return model.name == modelName;
    });
    if(foundModel !== undefined){
        res.render('modele', {foundModel});
    }
});

app.use((req, res, next) => {
    res.status(404).render('erreur');
});

app.listen(PORT, ()=>{
    console.log(`Serveur lancé sur http://localhost:${PORT}`);
});