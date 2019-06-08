var express = require('express');
var exphbs = require('express-handlebars');

var app = express();

app.engine('hbs', exphbs({
  defaultLayout: 'main.hbs',
  layoutsDir: 'views/_layouts',
}));
app.set('view engine', 'hbs');

app.get('/', (req, res) => {
  res.render('home');
});


app.use('/post', require('./routes/admin/post.route'));
app.use('/writter/writePost', require('./routes/admin/writePost.route'));

// Handle 404 error
app.use((req, res) => {
  res.status(400);
  res.render('_error/404_error', {title: '404: File not found', error: 'File not found'});
});

app.listen(3000, () => {
  console.log('Server is running at localhost:3000');
});