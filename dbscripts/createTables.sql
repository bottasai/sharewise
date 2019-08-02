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
) ;

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
)

CREATE TABLE `sharedatapoints` (
  `symbol` varchar(45) not null,
  `pe` float DEFAULT 0,
  `pbv` float DEFAULT 0,
  `div` float DEFAULT 0,
  `d2e` float DEFAULT 0,
  `roce` float DEFAULT 0,
  `qoqsales` float DEFAULT 0,
  `qoqprofit` float DEFAULT 0,
  `pholdings` float DEFAULT 0,
  `pe5y` float DEFAULT 0,
  `pe10y` float DEFAULT 0,
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

CREATE TABLE `vishalaholdings` (
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
create or replace view consolidatedHoldings as select symbol, sum(curVal) as investment from (select symbol,curVal from myholdings union select symbol,curVal from vishalaholdings) a group by symbol order by sum(curVal) desc;

create or replace view intradayswing as select symbol,((last-prevclose)/prevclose)*100 priceChange,tradedqty from bhavdata where (high-low)/open > 0.05 and last>open and date>DATE(NOW() - INTERVAL 1 DAY) and nooftrades > 10000;

create or replace view consolidateInvestmentView as select c.symbol,ROUND(c.investment,1),ROUND(5d.pricech,1) 5dchange,ROUND(10d.pricech,1) 10dchange, ROUND(20d.pricech,1) 20dchange from consolidatedHoldings c, stchanges5d 5d, stchanges10d 10d, stchanges20d 20d where 5d.symbol=c.symbol and c.symbol=10d.symbol and c.symbol=20d.symbol order by investment desc;

create table stockalerts(symbol varchar(20), up float, down float);
