#!/bin/bash
i=0;
days=$1
while [ "$i" -lt $days ]
do
whichDayNSE=`date --date "-$i day" +%d%m%Y`
echo $whichDayNSE
whichDayLoad=`date --date "-$i day" +%Y-%m-%d`
i=`expr $i + 1`
echo $i
wget -U Mozilla/5.0 https://www.nseindia.com/archives/equities/mto/MTO_$whichDayNSE.DAT
sh processTradeVolumeFeed.sh MTO_$whichDayNSE.DAT $whichDayLoad
MYSQL_USER="root"
MYSQL_PASSWORD="newpass123"
DBNAME="shares"
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $DBNAME < "loadVolumes.sql"
rm /home/saibotta/datafeeds/after/volumedata.csv
done
