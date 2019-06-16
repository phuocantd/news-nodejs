var db = require('../utils/db');

module.exports = {
    titleSearch: (string) => {
        return db.loadPost(`SELECT * FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}')`);
    }
};