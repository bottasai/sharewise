LOAD DATA LOCAL INFILE './data/bhavcopy.csv' 
INTO TABLE bhavdata 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(symbol,open,high,low,last,prevclose,tradedqty,nooftrades,date);
