const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database');

class GWModel extends Sequelize.Model {}

GWModel.init({ 

    id:{
        type:DataTypes.STRING,
        allowNull: false,
        primaryKey: true
    },
    name:{
        type:DataTypes.STRING,
        allowNull:false
    },
    releasedate:{
        type:DataTypes.STRING,
        allowNull:false
    },
    acronym:{
        type:DataTypes.STRING,
        allowNull:false
    },
    scarcity:{
        type:DataTypes.NUMBER,
        allowNull:false
    },
    series:{
        type:DataTypes.TEXT,
        allowNull:false
    },
    history:{
        type:DataTypes.TEXT,
        allowNull:false
    },
    gameplay:{
        type:DataTypes.TEXT,
        allowNull:false
    },
    secondmode:{
        type:DataTypes.TEXT,
        allowNull:false
    },
    details:{
        type:DataTypes.TEXT,
        allowNull:false
    },
    variations:{
        type:DataTypes.NUMBER,
        allowNull:false
    }
}, {

    sequelize,
    tableName: "gwModel",
    timestamps: false
});

module.exports = GWModel;
