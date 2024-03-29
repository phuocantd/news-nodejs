var express = require("express");
var post = require('../models/news.model');
var moment = require('moment');

var router = express.Router();

router.get('/', (req, res) => {
    // res.render('home');
    var query1 = post.lastestNews();
    query1.then(rows1 => {
        var query2 = post.newsPost();
        query2.then(rows2 => {
            var query3 = post.phonePost();
            query3.then(rows3 => {
                var query4 = post.laptopPost();
                query4.then(rows4 => {
                    var query5 = post.techPost();
                    query5.then(rows5 => {
                        if (rows1.length > 0) {
                            res.render('home', {
                                content: (rows1),
                                newsContent: (rows2),
                                phoneContent: (rows3),
                                laptopContent: (rows4),
                                techContent: (rows5),
                                content1: (rows1[0]),
                                time1: moment(rows1[0].PublishedDate).add(1, 'day').format('LLL'),
                                content2: (rows1[1]),
                                time2: moment(rows1[1].PublishedDate).add(1, 'day').format('LLL'),
                                content3: (rows1[2]),
                                time3: moment(rows1[2].PublishedDate).add(1, 'day').format('LLL'),
                                content4: (rows1[3]),
                                time4: moment(rows1[3].PublishedDate).add(1, 'day').format('LLL'),
                                content5: (rows1[4]),
                                time5: moment(rows1[4].PublishedDate).add(1, 'day').format('LLL'),
                            });
                        }
                    }).catch(error => {
                        console.log(error);
                    });
                }).catch(error => {
                    console.log(error);
                });
            }).catch(error => {
                console.log(error);
            });
        }).catch(error => {
            console.log(error);
        });
    }).catch(error => {
        console.log(error);
        res.render('_error/404_error', { title: '404: File not found', error: 'File not found', layout: false });
    });
});

module.exports = router;