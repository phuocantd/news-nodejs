var express = require('express');
var moment = require('moment');
var userModel = require('../models/user.model');
var auth = require('../middlewares/auth');


var router = express.Router();

router.get('/', auth, (req, res, next) => {
    res.render('vwProfile/index');
})

router.get('/edit', auth, (req, res, next) => {
    res.render('vwProfile/index');
})

router.post('/update', (req, res, next) => {
    var entity = req.user;
    var dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');
    entity.Name = req.body.name;
    entity.Email = req.body.email;
    entity.Address = req.body.address;
    entity.Phone = req.body.phone;
    entity.DOB = dob;
    userModel.update(entity).then(n => {
        res.redirect('/')
    })
    .catch(err => {
        console.log(err);
        res.end('error occused.')
    });
})

module.exports = router;