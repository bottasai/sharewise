cat $1 | grep ",EQ," | cut -d "," -f1,3,4,5,7,8,9,12 |awk -v date="$2" '{print $0,",",date}' > ./datafeeds/after/bhavcopy.csv
