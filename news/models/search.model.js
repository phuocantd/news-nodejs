var db = require('../utils/db');

module.exports = {
    titleSearch: (string) => {
        return db.load(`SELECT * FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}') and state = 4`);
    },
    tagSearch: (string) => {
        return db.load(`SELECT * 
        FROM DemoDB.Posts p, DemoDB.Posts_Tags pt, 
        (SELECT * FROM DemoDB.Tags 
        WHERE MATCH (TagName) AGAINST ('${string}')) t
        WHERE p.PostId = pt.PostId and pt.TagId = t.TagId 
        and p.PostId NOT IN (SELECT PostId FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}'))`);
    },

    counttitleSearch: (string, limit, offset) => {
        return db.load(`SELECT count(*) as total FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}')`);
    },

    counttagSearch: (string) => {
        return db.load(`SELECT count(*) as total  
        FROM DemoDB.Posts p, DemoDB.Posts_Tags pt, 
        (SELECT * FROM DemoDB.Tags 
        WHERE MATCH (TagName) AGAINST ('${string}')) t
        WHERE p.PostId = pt.PostId and pt.TagId = t.TagId 
        and p.PostId NOT IN (SELECT PostId FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}'))`);
    },

};