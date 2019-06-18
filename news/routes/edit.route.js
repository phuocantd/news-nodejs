var express = require("express");
var moment = require('moment');
var post = require('../models/post.model');
var user = require('../models/user.model');
var router = express.Router();

router.get('/', (req, res) => {
    var id = req.user.UserId;
    var url = '/editor/' + id;
    console.log(url);
    res.redirect(url);
});

router.get('/:id', (req, res) => {
    var id = req.params.id;
    res.render('editor/dashboard', {
        layout: 'editorDashboard.hbs',
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
            res.render('editor/edit', {
                layout: 'editorDashboard.hbs',
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

router.post('/:id/deny/:id1', (req, res) => {
    var query = post.deny(req.params.id1);
    query.then(() => {
        var query1 = user.addEditorDeniedPost(req.params.id, req.params.id1, moment().format("YYYY-MM-DD HH:mm:ss"));
        query1.then(() => {
            var url = '/editor/' + req.params.id + '/draft';
            res.redirect(url);
        }).catch(err => {
            console.log(err);
        });
    }).catch(err => {
        console.log(err);
    });
});

router.post('/:id/approve/:id1', (req, res) => {
    var query = post.approve(req.params.id1, moment().format("YYYY-MM-DD"));
    query.then(() => {
        var query1 = user.addEditorApprovedPost(req.params.id, req.params.id1, moment().format("YYYY-MM-DD HH:mm:ss"));
        query1.then(() => {
            var url = '/editor/' + req.params.id + '/published';
            res.redirect(url);
        }).catch(err => {
            console.log(err);
        });
    }).catch(err => {
        console.log(err);
    });
});

router.get('/:id/denied', (req, res) => {
    var id = req.params.id;
    var draftQuery = post.deniedPostEditor(id);
    draftQuery.then(rows => {
        res.render('editor/listPost', {
            layout: 'editorDashboard.hbs',
            deniedPost: rows,
            uid: id,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/:id/draft', (req, res) => {
    var id = req.params.id;
    var draftQuery = post.draftPostEditor(id);
    draftQuery.then(rows => {
        res.render('editor/listPost', {
            layout: 'editorDashboard.hbs',
            draftPost: rows,
            uid: id,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/:id/published', (req, res) => {
    var id = req.params.id;
    var publishedQuery = post.publishedPostEditor(id);
    publishedQuery.then(rows => {
        res.render('editor/listPost', {
            layout: 'editorDashboard.hbs',
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