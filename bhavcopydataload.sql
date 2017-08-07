LOAD DATA LOCAL INFILE '/home/saibotta/datafeeds/after/bhavcopy.csv' 
INTO TABLE bhavdata 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(symbol,open,high,low,close,last,tradedqty,nooftrades,date);
