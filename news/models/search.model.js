var db = require('../utils/db');

module.exports = {
    titleSearch: (string, limit, offset) => {
        return db.load(`SELECT * FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}')`);
    },
    tagSearch: (string) => {
        return db.load(`SELECT * 
        FROM DemoDB.Posts p, DemoDB.Posts_Tags pt, 
        (SELECT * FROM DemoDB.Tags t
        WHERE MATCH (TagName) AGAINST ('${string}')) 
        WHERE p.PostId = pt.PostId and pt.TagId = t.TagId 
        and p.PostId NOT IN (SELECT PostId FROM DemoDB.Posts 
        WHERE MATCH (Title,Description) AGAINST ('${string}'))`);
    },

    countBySearch: (string)=>{
        
    }
};