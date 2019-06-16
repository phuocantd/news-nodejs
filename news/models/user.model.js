var db = require('../utils/db');

module.exports = {
  all: () => {
    return db.loadPost('select * from users');
  },

  single: id => {
    return db.loadPost(`select * from users where UserId = ${id}`);
  },

  singleByUserName: userName => {
    return db.loadPost(`select * from users where UserName = '${userName}'`);
  },

  add: entity => {
    return db.add('users', entity);
  },

  update: entity => {
    var id = entity.UserId;
    delete entity.UserId;
    return db.update('users', 'UserId', entity, id);
  },

  delete: id => {
    return db.delete('users', 'UserId', id);
  }
};
