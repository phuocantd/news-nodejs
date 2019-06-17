var db = require('../utils/db');

module.exports = {
  all: () => {
    return db.load('select * from Users');
  },

  allByRole: role => {
    return db.load(`select u.UserId, u.Name, r.RoleName from Users u, Users_Roles ur, Roles r
    where u.UserId = ur.UserId and r.RoleId = ur.RoleId and r.RoleId = ${role}`);
  },

  single: id => {
    return db.load(`select * from Users where UserId = ${id}`);
  },

  singleByUserName: userName => {
    return db.load(`select * from Users where UserName = '${userName}'`);
  },

  add: entity => {
    return db.add('Users', entity);
  },

  update: entity => {
    return db.update('users', 'UserId', entity);
  },
  users_roles: (UserId, RoleName) => {
    var query = `select * from Roles r, Users_Roles ur
    where r.RoleId = ur.RoleId and r.RoleName = '${RoleName}' and ur.UserId = ${UserId}`;
    console.log(query);
    return db.loadPost(query);
  },
  deleteUserRole: id => {
    return db.load(`delete from Users_Roles where UserId = ${id}`);
  },

  deleteUser: id => {
    return db.load(`delete from Users where UserId = ${id}`);
  },

  addUserRole: (id, role) => {
    return db.load(`insert into Users_Roles values (${id}, ${role})`);
  },

  addPremium: (id, date) => {
    return db.load(`insert into Users_Premium values (${id}, '${date}')`);
  },

  loadPremiumUser: () => {
    return db.load(`SELECT u.UserId, u.Name, DATE_FORMAT(up.ExpiredDate, '%Y-%m-%d %H:%m:%s') time
    FROM DemoDB.Users u, DemoDB.Users_Premium up
    WHERE u.UserId = up.UserId`);
  },

  extendExpiredDate: (id, date) => {
    return db.load(`update Users_Premium set ExpiredDate = '${date}' where UserId = ${id}`);
  },

  loadEditorTag: id => {
    return db.load(`SELECT ett.TagId, ett.TagName FROM DemoDB.Users u ,
    (select et.*, t.TagName from DemoDB.Editors_Tags et, Tags t
    WHERE et.TagId = t.TagId) ett
    WHERE u.UserId = ett.UserId and u.UserId = ${id}`);
  },

  loadEditorAddTag: id => {
    return db.load(`SELECT t.* from Tags t
    WHERE t.TagId NOT IN (SELECT ett.TagId FROM DemoDB.Users u ,
    (select et.*, t1.TagName from DemoDB.Editors_Tags et, Tags t1
    WHERE et.TagId = t1.TagId) ett
    WHERE u.UserId = ett.UserId and u.UserId = ${id})`);
  },

  addEditorTag: (id, tag) => {
    return db.load(`INSERT INTO DemoDB.Editors_Tags (UserId, TagId) VALUES (${id}, ${tag})`);
  },
};
