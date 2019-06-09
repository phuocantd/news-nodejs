var express = require("express");
var post = require('../models/post.model');

var router = express.Router();

router.get('/:id', (req, res) => {
    var id = req.params.id;
    var content = post.content(id);
    content.then(rows => {
        // console.log(rows);
        res.render('vwPost/index', {
            content: rows
        });
    }).catch(error => {
        console.log(error);
    });
});

module.exports = router;