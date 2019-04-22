const Sequelize = require('sequelize');
const sequelize = new Sequelize('fibo_db', 'postgres', '090603', {
    dialect: 'postgres',
    host: "localhost",
    port: 5432,
    logging: false
});

class History extends Sequelize.Model { }
History.init({
    result: Sequelize.STRING,
    createdDate: Sequelize.DATE
}, { sequelize, modelName: 'history' });

sequelize.sync();
module.exports = { History }