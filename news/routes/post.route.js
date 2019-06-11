var express = require("express");
var post = require('../models/post.model');
var moment = require('moment');

var router = express.Router();

router.get('/:id', (req, res) => {
    var id = req.params.id;
    var content = post.content(id);
    content.then(rows => {
        // console.log(rows[0].Title);
        // console.log(moment(rows[0].PublishedDate).add(1, 'day').format('LLL'));
        res.render('vwPost/index', {
            singleContent: (rows[0]),
            multipleContent: rows,
            time: moment(rows[0].PublishedDate).add(1, 'day').format('LLL')
        });
    }).catch(error => {
        console.log(error);
    });
});

module.exports = router;