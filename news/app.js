var express = require('express');
var morgan = require('morgan');

var app = express();

app.use(morgan('dev'));
app.use(express.urlencoded());
app.use(express.json());

require('./middlewares/view-engine')(app);
require('./middlewares/session')(app);
require('./middlewares/passport')(app);

app.get('/', (req, res) => {
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
                content2: (rows1[0]),
                time2: moment(rows1[0].PublishedDate).add(1, 'day').format('LLL'),
                content3: (rows1[1]),
                time3: moment(rows1[1].PublishedDate).add(1, 'day').format('LLL'),
                content4: (rows1[1]),
                time4: moment(rows1[1].PublishedDate).add(1, 'day').format('LLL'),
                content5: (rows1[1]),
                time5: moment(rows1[1].PublishedDate).add(1, 'day').format('LLL'),
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

app.use(express.static('publics'));
// app.use('/post/example', require('./routes/admin/post.route'));
app.use('/account', require('./routes/account.route'));
app.use('/post', require('./routes/post.route'));
app.use('/writter/writePost', require('./routes/admin/writePost.route'));

// Handle error
app.use((req, res, next) => {
  res.render('_error/404_error', { title: '404: File not found', error: 'File not found', layout: false });
});

app.use((error, req, res, next) => {
  res.render('_error/error', { layout: false, message: error.message, error });
});

app.listen(3000, () => {
  console.log('Server is running at http://localhost:3000/');
});