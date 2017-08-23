select b.symbol,last,(last-prevclose)/prevclose*100,b.tradedqty, v.avgvolume 
from shares.bhavdata b,shares.volumeAvgs v 
where date > curdate() -1
#and (last-prevclose)/prevclose*100 > 0
and b.tradedqty > v.avgvolume*5
and b.symbol = v.symbol
and b.last > v.HIGH
#and b.last < v.avgprice * 1.1
and tradedqty > 200000
order by tradedqty desc

create or replace view shares.volumeAvgs as 
	select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from shares.bhavdata 
where date < curdate()-1
and date > curdate()-12
group by symbol

# Holding averages 
create or replace view shares.holdingsAvgs as 
select h.instrument
,b.tradedqty
,v.avgVolume
,b.last
,v.avgPrice 
from shares.shareholdings h,shares.volumeAvgs v
, shares.bhavdata b
where trim(h.instrument) = v.symbol
and trim(h.instrument) = b.symbol
and b.date = curdate() -3


create or replace view shares.bhav10dayagg as
select symbol, min(low) low,min(last) minlast,max(last) high, avg(last) avgprice 
from shares.bhavdata
where date > curdate() -12
and date < curdate()-3
group by symbol

create or replace view shares.bhav50dayagg as
select symbol, min(low) low,min(last) minlast,max(last) high, avg(last) avgprice 
from shares.bhavdata
where date > curdate() -60
and date < curdate()-10
group by symbol


# Find the share holdings which have fallen below 10 days price
select b.symbol,b.last, agg.minlast,agg.low, agg.avgprice from 
shares.shareholdings sh,
shares.bhav50dayagg agg,
shares.bhavdata b
where trim(sh.instrument) = b.symbol
and b.symbol = agg.symbol
and b.date > curdate() -1
and b.last < agg.avgprice

select symbol, ((last-prevclose)/prevclose)*100 from shares.bhavdata where date > curdate() -1
and symbol = 'ITC'

select * from shares.bhavdata where symbol = 'PCJEWELLER'
and date > curdate()-1


Error Code: 1064. You have an error in your SQL syntax;
 check the manual that corresponds to your MySQL server version for the right syntax
 to use near 'shares.bhavdata a where a.date=b.date - 1 and a.date < curdate() -2' at line 3

