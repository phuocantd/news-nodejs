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
    return db.update('users', 'UserId', entity);
  },

  delete: id => {
    return db.delete('users', 'UserId', id);
  },

  users_roles: (UserId, RoleName) => {
    var query=`select * from Roles r, Users_Roles ur
    where r.RoleId = ur.RoleId and r.RoleName = '${RoleName}' and ur.UserId = ${UserId}`;
    console.log(query);
    return db.loadPost(query);
  }
};
