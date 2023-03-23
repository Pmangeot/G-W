const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(process.env.PG_URL, {
    define: {
        updatedAt: 'updated_at',
        createdAt: 'created_at',
    },
});

module.exports = sequelize;
