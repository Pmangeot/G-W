const User = require('./User');
const Condition = require('./Condition');
const GWModel = require('./GWModel');
const Role = require('./Role');
const Specimen = require('./Specimen');

GWModel.hasMany(Specimen, {
    foreignKey: "model_id",
    as : "specimens",
});
Specimen.belongsTo(GWModel,{
    foreignKey: "model_id",
    as: "model",
});

User.hasMany(Specimen, {
    foreignKey: "user_id",
    as : "specimens",
});
Specimen.belongsTo(User,{
    foreignKey: "user_id",
    as: "specimen",
});

Condition.hasMany(Specimen, {
    foreignKey: "model_id",
    as : "specimens",
});
Specimen.belongsTo(Condition,{
    foreignKey: "condition_id",
    as: "condition",
});

Role.hasMany(User, {
    foreignKey: 'condition_id',
    as: 'users',
});

User.belongsTo(Role, {
    foreignKey: 'role_id',
    as: 'role',
});

module.exports = { User, Condition, GWModel, Specimen, Role };
