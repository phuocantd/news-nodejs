var mysql = require('mysql');

var createConnection = () => {
    return mysql.createConnection({
        host: 'localhost',
        user: 'root',
<<<<<<< HEAD
        password: '12345',
=======
        password: '1234',
>>>>>>> edf54e23a784bdc5e8dec26d80b59a5745ec82a1
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
    },
<<<<<<< HEAD
    load: sql => {
        return new Promise((resolve, reject) => {
            var connection = createConnection();
            connection.connect();
            connection.query(sql, (error, results, fields) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(results);
                }
                connection.end();
            });
        });
    },
=======
>>>>>>> edf54e23a784bdc5e8dec26d80b59a5745ec82a1

    add: (tableName, entity) => {
        return new Promise((resolve, reject) => {
            var sql = `insert into ${tableName} set ?`;
            var connection = createConnection();
            connection.connect();
            connection.query(sql, entity, (error, value) => {
<<<<<<< HEAD
                if (error) {
                    reject(error);
                } else {
                    resolve(value.insertId);
                }
                connection.end();
            });
        });
    },

    update: (tableName, idField, entity) => {
        return new Promise((resolve, reject) => {
            var id = entity[idField];
            delete entity[idField];

            var sql = `update ${tableName} set ? where ${idField} = ?`;
            var connection = createConnection();
            connection.connect();
            connection.query(sql, [entity, id], (error, value) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(value.changedRows);
                }
                connection.end();
            });
        });
    },

    delete: (tableName, idField, id) => {
        return new Promise((resolve, reject) => {
            var sql = `delete from ${tableName} where ${idField} = ?`;
            var connection = createConnection();
            connection.connect();
            connection.query(sql, id, (error, value) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(value.affectedRows);
                }
                connection.end();
            });
        });
    },
=======
                if (error) reject(error);
                else resolve(value.insertId);
                connection.end();
            });
        });
    }
>>>>>>> edf54e23a784bdc5e8dec26d80b59a5745ec82a1
};



