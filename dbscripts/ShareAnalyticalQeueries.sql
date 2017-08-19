#Shares averages
create or replace view shares.volumeAvgs as 
	select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from shares.bhavdata 
where date < curdate()-1
group by symbol

#Shares averages
create or replace view shares.volumeAvgs10days as 
	select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from shares.bhavdata 
where date < curdate()-1
and date > curdate()-12
group by symbol

select * from shares.volumeAvgs10days

# Holding averages 10 days 
create or replace view shares.Last10daysAvgs as 
select b.symbol
,b.tradedqty
,v.avgVolume
,b.last
,v.avgPrice 
,v.low
,v.high
from shares.volumeAvgs10days v
, shares.bhavdata b
where  v.symbol = b.symbol
and b.date = curdate() -1
# Shares with 10 days low higher than hostoricalAvgprice, close price higher than historical high
#tradeqty greter than avg historical volume
select l.* from shares.Last10daysAvgs l,shares.volumeAvgs v
where l.low > v.avgprice
and l.avgvolume > v.avgVolume * 2
and tradedqty > 100000
and l.symbol = v.symbol
order by tradedqty desc	