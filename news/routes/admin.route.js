var express = require("express");
var post = require('../models/post.model');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('admin/dashboard', {
        layout: 'admin.hbs'
    });
});

router.get('/draft', (req, res) => {
    var draftQuery = post.publishedPost();
    draftQuery.then(rows => {
        res.render('admin/draftPost', {
            layout: 'admin.hbs',
            draftPost: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/draft/edit/:id', (req, res) => {
    var id = req.params.id;
    console.log(id);
    var query = post.content(id);
    query.then(rows => {
        res.render('admin/edit', {
            layout: 'admin.hbs',
            content: rows[0],
        });
    }).catch(error => {
        console.log(error);
    });
});


module.exports = router;