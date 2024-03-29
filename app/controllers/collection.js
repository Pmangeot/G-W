//const gwlist = require('../data/gwlist.json');

const { Sequelize } = require("sequelize");
const { Specimen, GWModel } = require("../models");

const dataRefactor = (main, categoryType) => {
    const data = [];
    // on itere sur tous les modeles
    for (let i = 0; i< main.length; i++){
        let modelCategory = '';
        if (categoryType == "serie"){
        // on recupere la category de l'objet en cours
        modelCategory = Object.values(main)[i].series;
        } ;
        if (categoryType == "year"){
        modelCategory = Object.values(main)[i].releasedate.substring(0,4);
        };

        // on test si un object ayant comme attribut cette category existe deja dans notre tableau et on cree si false
        if (!data.find(item => item.name === modelCategory)) {
            const newCategory = { name: `${modelCategory}`, owned: 0, total: 0, models:[]};
            data.push(newCategory);
        }
        //on ajoute les informations des modeles dans l'objet concerne
        const catIndex = data.findIndex(item => item.name === modelCategory);
        data[catIndex].total++;
        data[catIndex].models.push(main[i]);
        // on compte le nombe de modeles possedes si on en a 
        if (main[i].specimens.length > 0){
            data[catIndex].owned++;
        };
    }
    return data;
};


const controller = {
    listBySeries: async (req, res)=>{
    const rawCollectionData = await GWModel.findAll({
        attributes : [
            'id',
            'name',
            'series'
        ],
        include : ['specimens'],
        order: [['releasedate', 'ASC']]
    });
    const categoryType = "serie";
    const collectionData = dataRefactor(rawCollectionData, categoryType);
        res.render('collection', {collectionData});
    },

    listByYear : async (req, res)=>{
        const rawCollectionData = await GWModel.findAll({
            attributes : [
                'id',
                'name',
                'series',
                'releasedate'
            ],
            include : ['specimens'],
            order: [['releasedate', 'ASC']]
        });
        const categoryType = "year";
        const collectionData = dataRefactor(rawCollectionData, categoryType);
            res.render('collection', {collectionData});
    }
}

module.exports = controller;