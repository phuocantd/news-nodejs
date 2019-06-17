var express = require("express");
var search = require('../models/search.model');

var router = express.Router();

router.get('/', (req, res) => {
    var queryTitle = search.titleSearch(req.query.keyword);
    queryTitle.then(rows1 => {
        var queryTag = search.tagSearch(req.query.keyword);
        queryTag.then(rows2 => {
            console.log(rows1);
            console.log(rows2);
            res.render('search/index', {
                results1: rows1,
                results2: rows2,
            });
        }).catch(error => {
            console.log(error);
        });
    }).catch(error => {
        console.log(error);
    });
});

module.exports = router;