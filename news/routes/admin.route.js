var express = require("express");
var post = require('../models/post.model');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('admin/dashboard', {
        layout: 'admin.hbs'
    });
});

router.get('/draft', (req, res) => {
    var draftQuery = post.draftPost();
    draftQuery.then(rows => {
        res.render('admin/listPost', {
            layout: 'admin.hbs',
            draftPost: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/published', (req, res) => {
    var publishedQuery = post.publishedPost();
    publishedQuery.then(rows => {
        res.render('admin/listPost', {
            layout: 'admin.hbs',
            publishedPost: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/draft/edit/:id', (req, res) => {
    var id = req.params.id;
    var query = post.content(id);
    query.then(rows => {
        var tagQuery = post.tags(id);
        tagQuery.then(tagRows => {
            res.render('admin/edit', {
                layout: 'admin.hbs',
                content: rows[0],
                tags: tagRows,
            });
        }).catch(error => {
            console.log(error);
        });
    }).catch(error => {
        console.log(error);
    });
});

router.post('/deny', (req, res) => {
    var query = post.deny(req.body.id);
    query.then(id => {
        res.redirect('/admin/draft');
    }).catch(err => {
        console.log(err);
    });
});

router.post('/approved', (req, res) => {
    var query = post.approve(req.body.id);
    query.then(id => {
        res.redirect('/admin/published');
    }).catch(err => {
        console.log(err);
    });
});

router.get('/tags', (req, res) => {
    var query = post.tags();
    query.then(rows => {
        console.log(rows);
        res.render('admin/tags', {
            layout: 'admin.hbs',
            tags: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});


module.exports = router;