CREATE TABLE `tradedVolumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `quantityTraded` bigint(20) NOT NULL,
  `quantityDelivered` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueperday` (`code`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=56270 DEFAULT CHARSET=latin1;