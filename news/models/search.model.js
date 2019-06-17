var db = require('../utils/db');

module.exports = {
    titleSearch: (string) => {
        return db.loadPost(`SELECT * FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}')`);
    },
    tagSearch: (string) => {
        return db.loadPost(`SELECT * 
        FROM DemoDB.Posts p, DemoDB.Posts_Tags pt, 
        (SELECT * FROM DemoDB.Tags 
        WHERE MATCH (TagName) AGAINST ('${string}')) t
        WHERE p.PostId = pt.PostId and pt.TagId = t.TagId`);
    }
};