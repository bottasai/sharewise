var express = require('express');
var app = express();
app.listen(1981,function()
{
    console.log("Application started on port 1981");

});

app.get("/", function(req,res)
{
res.send("Hello Sai");
});