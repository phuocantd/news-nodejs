var moment = require('moment');
var userModel = require('../models/user.model');

module.exports = (req, res, next) => {
  if (req.user) {
    res.locals.isAuthenticated = true;
    var user = req.user;
    userModel.users_roles(user.UserId, 'Admin').then(rows => {
      if (rows.length > 0) {
        res.locals.isAdmin = true;
      }
      else
        res.locals.isAdmin = false;
    })

    userModel.users_roles(user.UserId, 'Writter').then(rows => {
      if (rows.length > 0) {
        res.locals.isWriter = true;
      }
      else
        res.locals.isWriter = false;
    })
    res.locals.authUser = req.user;
    res.locals.dob = moment(req.user.DOB).format('DD/MM/YYYY');;
  }

  next();
}
