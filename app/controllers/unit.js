//const gwlist = require('../data/gwlist.json');
const { Specimen, GWModel } = require("../models");
const controller = {
    
    details: async (req, res) =>{
        const modelId = req.params.modelId;

        const foundModel = await GWModel.findOne({
            where:{id : `${modelId}`},
            include : ['specimens'],
        });
        console.log(foundModel);
        res.render('modele', {foundModel});
    }
}


module.exports = controller;
