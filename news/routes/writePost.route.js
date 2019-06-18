var express = require("express");
var moment = require('moment');
var post = require('../models/post.model');
var router = express.Router();

router.get('/', (req, res) => {
    var id = req.user.UserId;
    var url = '/writer/' + id;
    console.log(url);
    res.redirect(url);
});

router.get('/:id', (req, res) => {
    var id = req.params.id;
    res.render('writer/dashboard', {
        layout: 'writerDashboard.hbs',
        uid: id,
    });
});

router.get('/:id/writePost', (req, res) => {
    var id = req.params.id;
    res.render('writer/writePost', {
        layout: 'writerDashboard.hbs',
        uid: id,
    });
});

router.get('/:id/edit/:id1', (req, res) => {
    var id = req.params.id;
    var id1 = req.params.id1;
    var query = post.editContent(id1);
    query.then(rows => {
        var tagQuery = post.tagsId(id1);
        tagQuery.then(tagRows => {
            console.log(tagRows);
            res.render('writer/edit', {
                layout: 'writerDashboard.hbs',
                content: rows[0],
                tags: tagRows,
                uid: id,
            });
        }).catch(error => {
            console.log(error);
        });
    }).catch(error => {
        console.log(error);
    });
});

router.post('/:id/edit/:id1', (req, res) => {
    var id = req.params.id;
    var id1 = req.params.id1;
    var title = req.body.title;
    var description = req.body.description;
    var content = req.body.content;
    var currentTime = moment().format("YYYY-MM-DD");
    post.update(id1, title, description, content, currentTime)
        .then(() => {
            var url = '/writer/' + id + '/edit/' + id1;
            res.redirect(url);
        })
        .catch(error => {
            console.log(error);
        });
});

router.get('/:id/denied', (req, res) => {
    var id = req.params.id;
    var draftQuery = post.deniedPostId(id);
    draftQuery.then(rows => {
        res.render('writer/listPost', {
            layout: 'writerDashboard.hbs',
            deniedPost: rows,
            uid: id,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/:id/draft', (req, res) => {
    var id = req.params.id;
    var draftQuery = post.draftPostId(id);
    draftQuery.then(rows => {
        res.render('writer/listPost', {
            layout: 'writerDashboard.hbs',
            draftPost: rows,
            uid: id,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/:id/published', (req, res) => {
    var id = req.params.id;
    var publishedQuery = post.publishedPostId(id);
    publishedQuery.then(rows => {
        res.render('writer/listPost', {
            layout: 'writerDashboard.hbs',
            publishedPost: rows,
            uid: id,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.post('/:id', (req, res) => {
    //console.log(req.body);
    //res.end('....');
    var entity = {
        Title: req.body.title,
        Description: req.body.description,
        Content: req.body.content
    }

    post.add(entity)
        .then(id => {
            console.log(id);
            res.render("");
        })
        .catch(err => {
            console.log(err);
        })

    console.log(req.body);

})
module.exports = router;