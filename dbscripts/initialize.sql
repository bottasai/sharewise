SET GLOBAL local_infile = 1;
create database shares;
use shares;


CREATE TABLE `tradedVolumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `quantityTraded` bigint(20) NOT NULL,
  `quantityDelivered` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueperday` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=56270 DEFAULT CHARSET=latin1;

CREATE TABLE `bhavdata` (
  `bhavprimaryid` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(45) NOT NULL,
  `open` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `low` float DEFAULT NULL,
  `prevclose` float DEFAULT NULL,
  `last` float DEFAULT NULL,
  `tradedqty` int(11) DEFAULT NULL,
  `nooftrades` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`bhavprimaryid`),
  UNIQUE KEY `uniqueconst1` (`symbol`,`date`)
);

CREATE TABLE `sharedatapoints` (
  `symbol` varchar(45) not null,
  `pe` float DEFAULT 0,
  `pbv` float DEFAULT 0,
  `div` float DEFAULT 0,
  `d2e` float DEFAULT 0,
  `roce` float DEFAULT 0,
    PRIMARY KEY (`symbol`)
);

CREATE TABLE `myholdings` (
  `holdingprimaryid` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(45) not null,
  `qty` float not null ,
  `avgcost` float not null,
  `lastprice` float not null,
  `curVal` float not null,
  `profitloss` float not null,
  `netchange` float not null,
  `daychange` float not null,
  `date` timestamp default CURRENT_TIMESTAMP,
  PRIMARY KEY (`holdingprimaryid`),
  UNIQUE KEY `uniqueconst1` (`symbol`,`date`)
);


#Shares averages
create or replace view volumeAvgs as 
	select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from bhavdata 
where date < curdate()-1
group by symbol;

#Shares averages
create or replace view volumeAvgs10days as 
select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from bhavdata 
where date < curdate()-1
and date > curdate()-12
group by symbol;

# Holding averages 10 days 
create or replace view Last10daysAvgs as 
select b.symbol
,b.tradedqty
,v.avgVolume
,b.last
,v.avgPrice 
,v.low
,v.high
from volumeAvgs10days v
, bhavdata b
where  v.symbol = b.symbol
and b.date = curdate() -1;

# Shares with 10 days low higher than hostoricalAvgprice, close price higher than historical high
#tradeqty greter than avg historical volume
select l.* from Last10daysAvgs l,shares.volumeAvgs v
where l.low > v.avgprice
and l.avgvolume > v.avgVolume * 2
and tradedqty > 100000
and l.symbol = v.symbol
order by tradedqty desc	;

create or replace view stchanges as 
select symbol, avg(volchange) avgvolume, sum(pricechange) pricech, min(volume) minvolume from (
select a.symbol,((b.tradedqty-a.tradedqty)/a.tradedqty)*100 volchange,
 ((b.last-b.prevclose)/b.prevclose)*100 pricechange, b.tradedqty as volume,
 b.date
 from 
bhavdata b,
bhavdata a
where a.date=b.date -1
and b.date > curdate() -10
and a.symbol = b.symbol
) q
group by symbol;

-- to store the latest loaded date.
create or replace view latestdate as select max(date) date from bhavdata;

create or replace view sharemaxmin as select symbol,max(high) high,min(low) low,avg(tradedqty) avgvolume from bhavdata group by symbol;

select m.symbol,b.last,s.high,s.low,m.curVal from myholdings m, sharemaxmin s, bhavdata b, latestdate d where m.symbol = s.symbol and m.symbol = b.symbol and b.last < s.low and b.date = d.date;
