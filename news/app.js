var express = require('express');
var exphbs = require('express-handlebars');
var hbs_sections = require('express-handlebars-sections');
var morgan=require('morgan');

var app = express();

app.use(morgan('dev'));
app.use(express.urlencoded());
app.use(express.json());

app.engine('hbs', exphbs({
  defaultLayout: 'main.hbs',
  layoutsDir: 'views/_layouts',
  helpers: {
    format: val => {
      return numeral(val).format('0,0');
    },
    section: hbs_sections()
  }
}));
app.set('view engine', 'hbs');

app.get('/', (req, res) => {
  res.render('home');
});

app.use(express.static('publics'));
app.use('/account', require('./routes/account.route'))
app.use('/post/example', require('./routes/admin/post.route'));
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