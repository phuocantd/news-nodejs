var express = require("express");

var router = express.Router();

router.get('/', (req, res) => {
    res.end('Fucking data');
});

module.exports = router;