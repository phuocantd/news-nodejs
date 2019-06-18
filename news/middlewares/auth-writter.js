var userModel = require('../models/user.model');

module.exports = (req, res, next) => {
    if (req.user) {
        var user = req.user;
        userModel.users_roles(user.UserId, 'Writter').then(rows => {
            if (rows.length > 0) {
                next();
            }
            else res.redirect('/');
        })
    } else {
        res.redirect('/');
    }
}