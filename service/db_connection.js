'use strict'
var mysql = require('mysql');

//This is insecure as we have activated native authentication for this.
var con = mysql.createConnection({
  host: "172.18.0.2",
  user: "root",
  password: "mysql",
  database: "shares"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
module.exports = con;