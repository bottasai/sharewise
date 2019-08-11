LOAD DATA LOCAL INFILE '~/workspace/sharewise/sharewise/data/holdings.csv' 
INTO TABLE shares.myholdings 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(symbol,qty,avgcost,lastprice,curval,profitloss,netchange,daychange);