var moment = require('moment');

module.exports = (req, res, next) => {
  if (req.user) {
    res.locals.isAuthenticated = true;
    res.locals.authUser = req.user;
    res.locals.dob = moment(req.user.DOB).format('DD/MM/YYYY');;
  }

  next();
}
