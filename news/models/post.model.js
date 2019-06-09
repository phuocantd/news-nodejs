var db = require('../utils/db');

module.exports = {
    content: () => {
        return db.loadContent(`SELECT Content FROM DemoDB.Posts`);
    },
    content: id => {
        return db.loadContent(`SELECT Content FROM DemoDB.Posts WHERE PostId = ${id}`);
    },
};