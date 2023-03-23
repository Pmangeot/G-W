const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database');
const Role = require('./Role.js');

class User extends Sequelize.Model {}

User.init(
    {
        pseudo: {
            type: DataTypes.STRING,
            allowNull: false,
            unicode: true,
        },
        lastname: {
            type: DataTypes.STRING,
            allowNull: true,
            unicode: true,
        },
        firstname: {
            type: DataTypes.STRING,
            allowNull: true,
            unicode: true,
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false,
            unicode: true,
            unique: true,
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        role_id: {
            type: DataTypes.INTEGER,
        },
    },
    {
        sequelize,
        tableName: 'users',
    }
);

//User.belongsTo(Role(), { foreignKey: 'role_id' });

module.exports = User;
