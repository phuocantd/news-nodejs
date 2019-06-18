var db = require('../utils/db');

module.exports = {
    content: () => {
        return db.load(`SELECT Content FROM DemoDB.Posts`);
    },

    content: id => {
        return db.load(`select *
        from (select p.*, u.Name from Posts p inner join Users u on p.Author = u.UserId) pu inner join 
        (select pt.PostId, t.* from DemoDB.Posts_Tags pt inner join DemoDB.Tags t on pt.TagId = t.TagId) ptt
        on pu.PostId = ptt.PostId
        WHERE pu.PostId = ${id} and pu.State = 4`);
    },

    editContent: id => {
        return db.load(`select *
        from (select p.*, u.Name from Posts p inner join Users u on p.Author = u.UserId) pu inner join 
        (select pt.PostId, t.* from DemoDB.Posts_Tags pt inner join DemoDB.Tags t on pt.TagId = t.TagId) ptt
        on pu.PostId = ptt.PostId
        WHERE pu.PostId = ${id}`);
    },

    add: entity => {
        return db.add('DemoDB.Posts', entity);
    },

    draftPost: () => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State < 4 and Posts.State > 1`);
    },

    draftPostId: id => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where State < 4 and State > 1 and Author = ${id}`);
    },

    publishedPost: () => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State = 4`);
    },

    publishedPostId: id => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State = 4 and Author = ${id}`);
    },

    deniedPostId: id => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State = 1 and Author = ${id}`);
    },

    tagsId: id => {
        return db.load(`SELECT t.* FROM DemoDB.Tags t, DemoDB.Posts_Tags pt
        WHERE t.TagId = pt.TagId and pt.PostId = ${id}`);
    },

    tags: () => {
        return db.load(`SELECT * FROM DemoDB.Tags`);
    },

    deny: id => {
        return db.updateState(`update DemoDB.Posts set State = 1 where PostId = ${id}`);
    },

    approve: (id, date) => {
        return db.updateState(`update DemoDB.Posts set State = 4, PublishedDate = '${date}' where PostId = ${id}`);
    },

    update: (id, title, description, content, date) => {
        return db.updateState(`update DemoDB.Posts set Title = '${title}', Description = '${description}', 
        Content = '${content}', State = 2, DraftDate = '${date}' where PostId = ${id}`);
    },
};