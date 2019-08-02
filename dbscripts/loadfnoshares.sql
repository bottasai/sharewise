LOAD DATA LOCAL INFILE '~/workspace/sharewise/sharewise/data/fnoshares.csv' 
INTO TABLE shares.fnoshares
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(symbol);

