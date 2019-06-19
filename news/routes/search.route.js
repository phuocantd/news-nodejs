var express = require("express");
var search = require('../models/search.model');

var router = express.Router();
router.get('/', (req, res, next) => {
  // var page = req.params.page || 1;
  // if (page < 1) page = 1;
  // var limit = 3;
  // var offset = (page - 1) * limit;
  // var keyword = req.query.keyword;
  // Promise.all([
  //   search.tagSearch(req.query.keyword, limit, offset),
  //   search.counttagSearch(req.query.keyword),
  // ]).then(([rows2, count_rows]) => {
  //   var total = count_rows[0].total;
  //   var nPages = Math.floor(total / limit);
  //   if (total % limit > 0) nPages++;
  //   var pages = [];
  //   for (i = 1; i <= nPages; i++) {
  //     var obj = { value: i, active: i === +page };
  //     pages.push(obj);
  //   }
  //   console.log(pages);
  //   res.render('search/index', {
  //     results2: rows2,
  //     pages
  //   });
  // }).catch(next)

  //Pages la cai gi v??? laf mang chua caca phan tu 




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