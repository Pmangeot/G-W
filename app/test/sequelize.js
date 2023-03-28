const { Sequelize } = require("sequelize");
const { Specimen, GWModel } = require("../models");


async function test(){
    const collectionData = await Specimen.findAll({ attributes:['user_id','model_id'], where:{user_id:{[Sequelize.Op.eq]:1}}, include:['model'], group:['model_id', 'model.id']});
    console.log(collectionData);
}; 