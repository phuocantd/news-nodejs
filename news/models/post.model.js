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

    contentTag: id => {
        return db.load(`select * from Posts p, Posts_Tags pt, Tags t
        where p.PostId = pt.PostId and pt.TagId = t.TagId
        and t.TagId in (select ptt.TagId from (select p.*, u.Name from Posts p inner join Users u on p.Author = u.UserId) pu inner join 
        (select pt.PostId, t.* from DemoDB.Posts_Tags pt inner join DemoDB.Tags t on pt.TagId = t.TagId) ptt
        on pu.PostId = ptt.PostId
        WHERE pu.PostId = ${id} and pu.State = 4) limit 5`);
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

    addTags: (id, tag) => {
        return db.load(`insert into DemoDB.Posts_Tags values (${id}, ${tag})`);
    },

    draftPost: () => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State < 4 and Posts.State > 1`);
    },

    draftPostId: id => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where State < 4 and State > 1 and Author = ${id}`);
    },
    
    draftPostEditor: id => {
        return db.load(`select p.PostId, p.Title, p.Author, p.DraftDate, u.UserId
        from DemoDB.Posts p, DemoDB.Posts_Tags pt, DemoDB.Users u
        where p.PostId = pt.PostId 
        and pt.TagId in (select TagId from Editors_Tags
        where UserId = ${id}) and p.State = 2 and u.UserId = ${id}`);
    },

    publishedPost: () => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State = 4`);
    },

    publishedPostId: id => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State = 4 and Author = ${id}`);
    },
    
    publishedPostEditor: id => {
        return db.load(`select p.PostId, p.Title, p.Author, p.DraftDate 
        from DemoDB.Posts p, DemoDB.Posts_Tags pt
        where p.PostId = pt.PostId 
        and pt.TagId in (select TagId from Editors_Tags
        where UserId = ${id}) and p.State = 4
        and p.PostId in (SELECT et.PostId FROM DemoDB.Editors_Posts et where et.UserId = ${id})`);
    },

    deniedPostId: id => {
        return db.load(`select PostId, Title, Author, DraftDate from DemoDB.Posts where Posts.State = 1 and Author = ${id}`);
    },

    deniedPostEditor: id => {
        return db.load(`select p.PostId, p.Title, p.Author, p.DraftDate 
        from DemoDB.Posts p, DemoDB.Posts_Tags pt
        where p.PostId = pt.PostId 
        and pt.TagId in (select TagId from Editors_Tags
        where UserId = ${id}) and p.State = 1
        and p.PostId in (SELECT et.PostId FROM DemoDB.Editors_Posts et where et.UserId = ${id})`);
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