var db = require('../utils/db');

module.exports = {
    lastestNews: () => {
        return db.load(`SELECT * FROM (
            SELECT * FROM DemoDB.Posts ORDER BY PostId DESC LIMIT 5
        ) sub
        ORDER BY PostId ASC`);
    },
    newsPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 1
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    phonePost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 2
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    androidPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 3
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    iosPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 4
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    laptopPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 5
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    asusPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 6
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    dellPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 7
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    hpPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 8
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    msiPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 9
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    techPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 10
            ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
};