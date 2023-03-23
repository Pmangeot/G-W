const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database');
const User = require('./User.js');
const User = require('./User.js');

class Specimen extends Sequelize.Model {}

Specimen.init(
    {
        user_id: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        model_id: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        serial: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        condition: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
        defaults: {
            type: DataTypes.TEXT,
            allowNull: true,
        },
        isBattCoverMissing: {
            type: DataTypes.BOOLEAN,
            allowNull: true,
        },
        isBoxMissing: {
            type: DataTypes.BOOLEAN,
            allowNull: true,
        },
        restoration: {
            type: DataTypes.TEXT,
            allowNull: true,
        },
        variation: {
            type: DataTypes.TEXT,
            allowNull: true,
        }
    },
    {
        sequelize,
        tableName: 'users',
    }
);


module.exports = User;
