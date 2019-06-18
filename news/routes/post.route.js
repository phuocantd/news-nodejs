var express = require("express");
var post = require('../models/post.model');
var moment = require('moment');

var router = express.Router();

router.get('/:id', (req, res) => {
    var id = req.params.id;
    var query = post.content(id);
    query.then(rows => {
        // console.log(rows);
        console.log(req.params.id);
        // console.log(moment(rows[0].PublishedDate).add(1, 'day').format('LLL'));
        if (rows.length > 0) {
            res.render('vwPost/index', {
                singleContent: (rows[0]),
                multipleContent: rows,
                time: moment(rows[0].PublishedDate).add(1, 'day').format('LLL')
            });
        }
        else {
            res.render('_error/404_error', { title: '404: File not found', error: 'File not found', layout: false });
        }
    }).catch(error => {
        console.log(error);
    });
});

module.exports = router;