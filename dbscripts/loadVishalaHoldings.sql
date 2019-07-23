LOAD DATA LOCAL INFILE '~/workspace/sharewise/sharewise/data/holdingsVishala.csv' 
INTO TABLE shares.vishalaholdings 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(symbol,qty,avgcost,lastprice,curval,profitloss,netchange,daychange);
