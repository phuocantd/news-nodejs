var express = require('express');
var morgan = require('morgan');
var auth_admin=require('./middlewares/auth-admin');

var app = express();

app.use(morgan('dev'));
// app.use(express.urlencoded({ extended: false }));
// app.use(express.json());
var bodyParser = require('body-parser')
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

require('./middlewares/view-engine')(app);
require('./middlewares/session')(app);
require('./middlewares/passport')(app);
require('./middlewares/upload')(app);

app.use(require('./middlewares/auth-locals.mdw'));

app.use('/', require('./routes/homepage.route'));
app.post('/', (req, res, next) => {
  var query = req.body.textSearch;
  var url = '/search?keyword=' + query;
  res.redirect(url);
});

app.use(express.static('publics'));
// app.use('/post/example', require('./routes/admin/post.route'));
app.use('/account', require('./routes/account.route'));
app.use('/profile', require('./routes/profile.route'));
app.use('/post', require('./routes/post.route'));
app.use('/search', require('./routes/search.route'));
app.use('/writter/writePost', require('./routes/writePost.route'));
app.use('/admin', auth_admin, require('./routes/admin.route'));

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
// Sao day, doi port ah???uhm ddooir