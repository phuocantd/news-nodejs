var db = require('../utils/db');

module.exports = {
    content: () => {
        return db.loadContent(`SELECT Content FROM news_nodejs.Posts`);
    },
    content: id => {
        return db.loadContent(`SELECT puuu.*, ptt.TagName
        FROM (select p.*, puu.Name from DemoDB.Posts p inner join 
        (select pu.PostId, u.* from DemoDB.Posts_Users pu inner join DemoDB.Users u on pu.Author = u.UserId) puu 
        on p.PostId = puu.PostId) puuu inner join
        (select pt.PostId, t.* from DemoDB.Posts_Tags pt inner join DemoDB.Tags t on pt.TagId = t.TagId) ptt
        on puuu.PostId = ptt.PostId
        WHERE puuu.PostId = ${id}`);
    },
};