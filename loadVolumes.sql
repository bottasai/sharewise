LOAD DATA LOCAL INFILE '/home/saibotta/datafeeds/after/volumedata.csv' 
INTO TABLE tradedVolumes 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(code,quantityTraded,quantityDelivered,date);
