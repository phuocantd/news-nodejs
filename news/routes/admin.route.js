var express = require("express");
var search = require('../models/search.model');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('admin/dashboard', { title: '404: File not found', error: 'File not found', layout: false });
});

module.exports = router;