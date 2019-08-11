'user strict';
var sql = require('./db_connection.js');
var data;
//portfolio object constructor
var portfolio = function(portfolio){
   };
//Refer : https://stackoverflow.com/questions/18361930/node-js-returning-result-from-mysql-query

portfolio.getPortfolio = function (userId,results) {
    sql.query("select m.symbol,s.pricech from myholdings m, stchanges5d s where m.symbol=s.symbol order by pricech asc", function (err, rows,fields) {     

            if(err) {
                console.log("error: ", err);
                if(typeof results == "function")
                    results(err,null);
                else    
                    console.log("Incorrect callback function");
            }
            if(typeof results == "function")
                results(null,rows);
            else    
                console.log("Incorrect callback function");
        });   
};

module.exports = portfolio;
