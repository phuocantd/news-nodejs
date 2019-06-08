var mysql = require('mysql');
var createConnection = () => {
    return mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'Tintin579314',
        database: 'DemoDB'
    });
};

module.exports = {
    loadContent: sql => {
        return new Promise((resolve, reject) => {
            var connection = createConnection();
            connection.connect();
            connection.query(sql, (error, results, fields) => {
                if (error) reject(error);
                else resolve(results);

                connection.end();
            });
        });
    }
};



