var express = require("express");
var post = require('../models/post.model');
var user = require('../models/user.model');
var moment = require('moment');

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
    query.then(() => {
        res.redirect('/admin/draft');
    }).catch(err => {
        console.log(err);
    });
});

router.post('/approved', (req, res) => {
    var query = post.approve(req.body.id);
    query.then(() => {
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

router.get('/users/all', (req, res) => {
    var query = user.all();
    query.then(rows => {
        res.render('admin/users', {
            layout: 'admin.hbs',
            users: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/users/premium', (req, res) => {
    var query = user.loadPremiumUser();
    query.then(rows => {
        res.render('admin/premiumUsers', {
            layout: 'admin.hbs',
            users: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/users/writer', (req, res) => {
    var query = user.allByRole(2);
    query.then(rows => {
        res.render('admin/writerUsers', {
            layout: 'admin.hbs',
            users: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/users/editor', (req, res) => {
    var query = user.allByRole(3);
    query.then(rows => {
        res.render('admin/editorUsers', {
            layout: 'admin.hbs',
            users: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.get('/users/admin', (req, res) => {
    var query = user.allByRole(4);
    query.then(rows => {
        res.render('admin/adminUsers', {
            layout: 'admin.hbs',
            users: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

router.post('/removeAccount', (req, res) => {
    var query1 = user.deleteUserRole(req.body.id);
    query1.then(() => {
        var query2 = user.deleteUser(req.body.id);
        query2.then(() => {
            res.redirect('/admin/users/all');
        }
        ).catch(err => {
            res.render('_error/error', { layout: false, message: err.message, err });
        });
    }).catch(err => {
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.post('/addAdmin', (req, res) => {
    var query = user.addUserRole(req.body.id, 4);
    query.then(() => {
        res.redirect('/admin/users/all');
    }).catch(err => {
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.post('/addWriter', (req, res) => {
    var query = user.addUserRole(req.body.id, 2);
    query.then(() => {
        res.redirect('/admin/users/all');
    }).catch(err => {
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.post('/addEditor', (req, res) => {
    var query = user.addUserRole(req.body.id, 3);
    query.then(() => {
        res.redirect('/admin/users/all');
    }).catch(err => {
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.post('/addPremium', (req, res) => {
    var query1 = user.addUserRole(req.body.id, 1);
    query1.then(() => {
        var currentTime = moment().format("YYYY-MM-DD HH:mm:ss");
        var query2 = user.addPremium(req.body.id, currentTime);
        query2.then(() => {
            res.redirect('/admin/users/premium');
        }).catch(err => {
            console.log(err);
            res.render('_error/error', { layout: false, message: err.message, err });
        });
    }).catch(err => {
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.post('/extendPremium', (req, res) => {
    var currentTime = moment().format("YYYY-MM-DD HH:mm:ss");
    var query = user.extendExpiredDate(req.body.id, currentTime);
    query.then(() => {
        res.redirect('/c/users/premium');
    }).catch(err => {
        console.log(err);
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.get('/users/editor/:id/tags', (req, res) => {
    var query = user.loadEditorTag(req.params.id);
    query.then(rows => {
        res.render('admin/editorTags', {
            layout: 'admin.hbs',
            tags: rows,
            uid: req.params.id,
        })
    }).catch(err => {
        console.log(err);
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.get('/users/editor/:id/tags/add', (req, res) => {
    var query = user.loadEditorAddTag(req.params.id);
    query.then(rows => {
        res.render('admin/addEditorTags', {
            layout: 'admin.hbs',
            tags: rows,
        })
    }).catch(err => {
        console.log(err);
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});

router.post('/users/editor/:id/tags/add', (req, res) => {
    console.log(req.params.id);
    var query = user.addEditorTag(req.params.id, req.body.TagId);
    query.then(() => {
        var url = '/admin/users/editor/' + req.params.id + '/tags';
        res.redirect(url);
    }).catch(err => {
        console.log(err);
        res.render('_error/error', { layout: false, message: err.message, err });
    });
});


module.exports = router;