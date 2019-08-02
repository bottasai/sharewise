LOAD DATA LOCAL INFILE '~/workspace/sharewise/sharewise/data/sharefinancials_29Jul19.csv' 
INTO TABLE shares.sharedatapoints 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
