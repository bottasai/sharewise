#! /bin/bash
i=1;
days=$1
while [ "$i" -lt $days ];
do
	dailyFileName=cm`date --date "-$i day" +%d%b%Y | tr [a-z] [A-Z]`bhav.csv
	#echo $whichDayNSE
	monthid=`date --date "-$i day" +%b` 
	#echo $monthid
	month=`echo $monthid | tr [a-z] [A-Z]`
	#echo $month
	year=`date --date "-$i day" +%Y`
	fileDate=`date --date "-$i day" +%Y-%m-%d`
	whichDayLoad=`date --date "-$i day" +%Y-%m-%d`
	#echo $i
	wget -U Mozilla/5.0 https://www.nseindia.com/content/historical/EQUITIES/$year/$month/$dailyFileName.zip
	unzip $dailyFileName.zip
	sh processBhavCopyFeed.sh $dailyFileName $whichDayLoad
	MYSQL_USER="root"
	MYSQL_PASSWORD="newpass123"
	DBNAME="shares"
	mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $DBNAME < "bhavcopydataload.sql"
	#rm /home/saibotta/datafeeds/after/bhavcopy.csv 
	#rm $dailyFileName*
	i=`expr $i + 1`
done
