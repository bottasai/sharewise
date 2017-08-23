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
)