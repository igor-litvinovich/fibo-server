const Sequelize = require('sequelize');
const config = require('config');

const sequelize = new Sequelize(config.get('db.name'),
    config.get('db.username'),
    config.get('db.password'), {
        dialect: config.get('db.dialect'),
        host: config.get('db.host'),
        port: config.get('db.port'),
        logging: false
    });

class History extends Sequelize.Model { }
History.init({
    result: Sequelize.STRING,
    createdDate: Sequelize.DATE
}, { sequelize, modelName: 'history' });

sequelize.sync();
module.exports = { History }
