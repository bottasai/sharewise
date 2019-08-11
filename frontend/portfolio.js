'user strict';
var sql = require('./db_connection.js');
var data;
//portfolio object constructor
var portfolio = function(portfolio){
   };
//Refer : https://stackoverflow.com/questions/18361930/node-js-returning-result-from-mysql-query

portfolio.getPortfolio = function (username,change,days,results) {
    var Query = "";
    var table = "";
    if(days=='5d')
        table = 'stchanges5d';
    else if (days=='10d')
        table = 'stchanges10d';
console.log("Table Name:"+ table);
    if (change < 0)
        Query = "select m.symbol,s.pricech from holdings m, "+table+" s where m.username='"+username+"' and m.symbol=s.symbol and pricech < "+change +" order by pricech asc";
    else
        Query = "select m.symbol,s.pricech from holdings m, "+table+" s where m.username='"+username+"' and m.symbol=s.symbol and pricech > "+ change +" order by pricech asc";

    console.log(Query);

    sql.query(Query, function (err, rows,fields) {     

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
