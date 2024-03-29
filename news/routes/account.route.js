var express = require('express');
var bcrypt = require('bcrypt');
var moment = require('moment');
var passport = require('passport');
var userModel = require('../models/user.model');
var auth = require('../middlewares/auth');
var nauth = require('../middlewares/nauth');
var request = require('request');

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

router.get('/register', nauth, (req, res, next) => {
    res.render('vwAccount/register');
})

router.post('/register', (req, res, next) => {
    if (req.body['g-recaptcha-response'] === undefined || req.body['g-recaptcha-response'] === '' || req.body['g-recaptcha-response'] === null) {
        //res.redirect('/account/register');
        return res.render('vwAccount/register', {
            err_message: 'Please select captcha first'
        })
    }
    const secretKey = "6LdpvDEUAAAAAHszsgB_nnal29BIKDsxwAqEbZzU";

    const verificationURL = "https://www.google.com/recaptcha/api/siteverify?secret=" + secretKey + "&response=" + req.body['g-recaptcha-response'] + "&remoteip=" + req.connection.remoteAddress;

    request(verificationURL, function (error, response, body) {
        body = JSON.parse(body);

        if (body.success !== undefined && !body.success) {
            //res.redirect('/account/register');
            return res.render('vwAccount/register', {
                err_message: 'Failed captcha verification'
            })
        }
        else {
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
        }
    });
})

router.get('/login', nauth, (req, res, next) => {
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

// router.get('/profile', auth, (req, res, next) => {
//     //res.render('vwAccount/login', { layout: false });
//     res.send('profile');
// })

router.post('/logout', auth, (req, res, next) => {
    req.logOut();
    res.redirect('/account/login');
})

module.exports = router;