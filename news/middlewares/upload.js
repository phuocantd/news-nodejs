var multer = require('multer');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './publics/post_pictures')
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
})

var upload = multer({ storage });

module.exports = function (app) {
    app.post('/writer/writePost', (req, res, next) => {
        upload.array('input-pic')(req, res, err => {
            if (err) {
                return res.json({
                    error: err.message
                });
            }

            res.json({});
        })
    })
};