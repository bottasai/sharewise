cat $1 | grep EQ | grep 20 | cut -d "," -f3,5,6 |awk -v date="$2" '{print $0,",",date}'

