<<<<<<< HEAD
LOAD DATA LOCAL INFILE './datafeeds/after/bhavcopy.csv' 
=======
LOAD DATA LOCAL INFILE './data/bhavcopy.csv' 
>>>>>>> df70eee93dd76070191fb569bd98733276f0c7ca
INTO TABLE bhavdata 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(symbol,open,high,low,last,prevclose,tradedqty,nooftrades,date);
