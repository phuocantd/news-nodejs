var db = require('../utils/db');

module.exports = {
    content: () => {
        return db.loadContent(`SELECT Content FROM DemoDB.Posts`);
    },
    content: id => {
        return db.loadContent(`select *
        from (select p.*, u.Name from Posts p inner join Users u on p.Author = u.UserId) pu inner join 
        (select pt.PostId, t.* from DemoDB.Posts_Tags pt inner join DemoDB.Tags t on pt.TagId = t.TagId) ptt
        on pu.PostId = ptt.PostId
        WHERE pu.PostId = ${id}`);
    },
};