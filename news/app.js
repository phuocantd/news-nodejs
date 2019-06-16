var express = require('express');
var exphbs = require('express-handlebars');
var hbs_sections = require('express-handlebars-sections')
var post = require('./models/post.model');

var app = express();

app.engine('hbs', exphbs({
  defaultLayout: 'main.hbs',
  layoutsDir: 'views/_layouts',
  helpers: {
    section: hbs_sections()
  }
}));
app.set('view engine', 'hbs');

app.get('/', (req, res) => {
  // res.render('home');
  var query1 = post.content();
  query1.then(rows => {
    var query2 = post.content;









    // if (rows.length > 0) {
    //   res.render('home', {
    //     singleContent: (rows[0]),
    //     multipleContent: rows,
    //     time: moment(rows[0].PublishedDate).add(1, 'day').format('LLL')
    //   });
    // }
    // else {
    //   res.render('_error/404_error', { title: '404: File not found', error: 'File not found', layout: false });
    // }
  }).catch(error => {
    console.log(error);
  });
});

app.use(express.static('publics'));
// app.use('/post/example', require('./routes/admin/post.route'));
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
  console.log('Server is running at localhost:3000');
});