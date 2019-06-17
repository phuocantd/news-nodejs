var db = require('../utils/db');

module.exports = {
    content: () => {
        return db.loadPost(`SELECT Content FROM DemoDB.Posts`);
    },
    content: id => {
        return db.loadPost(`select *
        from (select p.*, u.Name from Posts p inner join Users u on p.Author = u.UserId) pu inner join 
        (select pt.PostId, t.* from DemoDB.Posts_Tags pt inner join DemoDB.Tags t on pt.TagId = t.TagId) ptt
        on pu.PostId = ptt.PostId
        WHERE pu.PostId = ${id}`);
    },
    add: entity => {
        return db.add('DemoDB.Posts', entity);
    },
    draftPost: () => {
        return db.loadPost(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State < 4 and Posts.State > 1`);
    },
    publishedPost: () => {
        return db.loadPost(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State = 4`);
    },
    tags: id => {
        return db.loadPost(`SELECT t.* FROM DemoDB.Tags t, DemoDB.Posts_Tags pt
        WHERE t.TagId = pt.TagId and pt.PostId = ${id}`);
    },
    tags: () => {
        return db.loadPost(`SELECT * FROM DemoDB.Tags`);
    },
    deny: id => {
        return db.updateState(`update DemoDB.Posts set State = 1 where PostId = ${id}`);
    },
    approve: id => {
        return db.updateState(`update DemoDB.Posts set State = 4 where PostId = ${id}`);
    },
};