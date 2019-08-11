var express = require('express');
var app = express();
var portfolio = require('./portfolio.js');
app.listen(1981,function()
{
    console.log("Application started on port 1981");

});
app.set("view engine","vash")

app.get("/", function(req,res)
{
    res.send("Hello Vishala");
});

app.get("/mypf", function(req,res)
{
    var processResults = function(err,results)
    {
        console.log(results.length);
        res.render('portfolioview',{title:"My Portfolio",results});

    }
    portfolio.getPortfolio(1,processResults);
});
