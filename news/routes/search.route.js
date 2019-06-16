var express = require("express");
var search = require('../models/search.model');

var router = express.Router();

router.get('/', (req, res) => {
    var query = search.titleSearch(req.query.keyword);
    query.then(rows => {
        console.log(rows);
        res.render('search/index', {
            results: rows,
        });
    }).catch(error => {
        console.log(error);
    });
});

module.exports = router;