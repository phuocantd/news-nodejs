var express = require("express");

var router = express.Router();
var writePostModle = require('../models/post.model');
var moment = require('moment');
router.get('/', (req, res) => {
    res.render('writer/index');
});

router.post('/',(req, res) =>{
    //console.log(req.body);
    //res.end('....');
    var entity ={
        Title: req.body.title,
        Description: req.body.description,
        Content: req.body.content,
        DraftDate: moment().format("YYYY-MM-DD")
    }

    writePostModle.add(entity)
    .then(id => {
        console.log(id);
        res.render("");
    })
    .catch(err =>{
        console.log(err);
    })

    console.log(req.body);

})
module.exports = router;