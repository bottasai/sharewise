import mysql.connector
import csv
from tabulate import tabulate
conn=mysql.connector.connect(user='root',password='mysql',host='172.18.0.2',database='shares',auth_plugin='mysql_native_password')
mycursor=conn.cursor()
i=0
print("****************Bears**********")
mycursor.execute("select m.symbol,s.pricech from myholdings m, stchanges5d s where m.symbol=s.symbol and s.pricech < -5 order by pricech desc")
rows=mycursor.fetchall()
print(tabulate(rows, headers=['symbol', 'pricechange5d'], tablefmt='psql'))
mycursor.execute("select m.symbol,s.pricech from myholdings m, stchanges10d s where m.symbol=s.symbol and s.pricech < -5 order by pricech desc")
rows=mycursor.fetchall()
print(tabulate(rows, headers=['symbol', 'pricechange10d'], tablefmt='psql'))
print("************Bulls**************")
mycursor.execute("select m.symbol,s.pricech from myholdings m, stchanges5d s where m.symbol=s.symbol and s.pricech  > 5 order by pricech desc")
rows=mycursor.fetchall()
print(tabulate(rows, headers=['symbol', 'pricechange5d'], tablefmt='psql'))
mycursor.execute("select m.symbol,s.pricech from myholdings m, stchanges10d s where m.symbol=s.symbol and s.pricech  > 5 order by pricech desc")
rows=mycursor.fetchall()
print(tabulate(rows, headers=['symbol', 'pricechange10d'], tablefmt='psql'))
