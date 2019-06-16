var express = require('express');
var bcrypt = require('bcrypt');
var moment = require('moment');
var passport = require('passport');
var userModel = require('../models/user.model');

var router = express.Router();

router.get('/is-available', (req, res, next) => {
    var user = req.query.username;
    userModel.singleByUserName(user).then(rows => {
        if (rows.length > 0) {
            return res.json(false);
        }

        return res.json(true);
    })
})

router.get('/register', (req, res, next) => {
    res.render('vwAccount/register');
})

router.post('/register', (req, res, next) => {
    console.log(req.body);
    var saltRounds = 10;
    var hash = bcrypt.hashSync(req.body.password, saltRounds);
    var dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');

    var entity = {
        UserName: req.body.username,
        Password: hash,
        Name: req.body.name,
        Email: req.body.email,
        Address: req.body.address,
        Phone: req.body.phone,
        DOB: dob,
    }

    userModel.add(entity).then(id => {
        res.redirect('/account/login');
    }).catch(error => {
        console.log(error);
    });
})

router.get('/login', (req, res, next) => {
    res.render('vwAccount/login', { layout: false });
})

router.post('/login', (req, res, next) => {
    passport.authenticate('local', (err, user, info) => {
        if (err)
            return next(err);

        if (!user) {
            return res.render('vwAccount/login', {
                layout: false,
                err_message: info.message
            })
        }

        req.logIn(user, err => {
            if (err)
                return next(err);

            return res.redirect('/');
        });
    })(req, res, next);
})

module.exports = router;