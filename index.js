const express = require("express");
const app = express();
const gwlist = require('./data/gwlist.json');
const port = 3030;

app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(express.static('public'));

app.locals.gwlist = gwlist;

app.get('/', (req, res)=>{
    res.render('index');
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

app.listen(port, ()=>{
    console.log(`Serveur lancé sur http://localhost:${port}`);
});