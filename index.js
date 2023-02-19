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

app.get('/film/:idDuFilm', (req, res)=>{

    const idDuFilm = req.params.idDuFilm;
    console.log(idDuFilm)

    const foundFilm = filmographie.find((film)=>{
        return film.id == idDuFilm;
    });
    console.log(foundFilm);
    if(foundFilm !== undefined){
        res.render('film', {foundFilm});
    }
});

app.use((req, res, next) => {
    res.status(404).render('erreur');
});

app.listen(port, ()=>{
    console.log(`Serveur lancé sur http://localhost:${port}`);
});