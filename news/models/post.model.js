var db = require('../utils/db');

module.exports = {
    content: () => {
        return db.loadContent('SELECT Content FROM DemoDB.Posts');
    }
};