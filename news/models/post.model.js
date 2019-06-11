var db = require('../utils/db');

module.exports = {
    content: () => {
        return db.loadContent(`SELECT Content FROM news_nodejs.Posts`);
    },
    content: id => {
        return db.loadContent(`SELECT Content FROM news_nodejs.Posts WHERE PostId = ${id}`);
    },
};