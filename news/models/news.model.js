var db = require('../utils/db');

module.exports = {
    lastestNews: () => {
        return db.load(`SELECT * FROM (
            SELECT * FROM DemoDB.Posts WHERE State = 4 ORDER BY PostId DESC LIMIT 5
        ) sub
        ORDER BY PostId ASC`);
    },
    newsPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 1
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    phonePost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 2
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    androidPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 3
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    iosPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 4
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    laptopPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 5
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    asusPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 6
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    dellPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 7
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    hpPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 8
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    msiPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 9
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
    techPost: () => {
        return db.load(`(SELECT * FROM (
            SELECT Posts.* FROM DemoDB.Posts, DemoDB.Posts_Tags, DemoDB.Tags
            WHERE Posts.PostId = Posts_Tags.PostId and Posts_Tags.TagId = 10
            and State = 4 ORDER BY Posts.PostId DESC LIMIT 5
        ) sub
        ORDER BY sub.PostId ASC)`);
    },
};