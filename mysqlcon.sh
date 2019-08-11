MYSQL_USER="root"
MYSQL_PASSWORD="mysql"
<<<<<<< HEAD
DBNAME="shares"

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h 172.18.0.3 < ./dbscripts/initialize.sql

=======
DBNAME="sharewise"

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h 172.17.0.5
>>>>>>> df70eee93dd76070191fb569bd98733276f0c7ca
