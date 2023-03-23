const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database');

class Condition extends Sequelize.Model {}

Condition.init(
    {
        is: {
            type: DataTypes.STRING,
            allowNull: false,
            unicode: true,
            unique: true,
        },
    },
    {
        sequelize,
        tableName: 'condition',
    }
);

module.exports = Condition;
