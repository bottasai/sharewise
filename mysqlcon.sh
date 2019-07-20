MYSQL_USER="root"
MYSQL_PASSWORD="mysql"
DBNAME="shares"

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h 172.18.0.3 < ./dbscripts/initialize.sql

