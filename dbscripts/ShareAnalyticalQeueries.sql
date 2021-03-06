#Shares averages
create or replace view volumeAvgs as 
	select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from bhavdata 
where date < curdate()-1
group by symbol;

#Shares averages
create or replace view volumeAvgs10days as 
select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from bhavdata 
where date < curdate()-1
and date > curdate()-12
group by symbol;

select * from shares.volumeAvgs10days

# Holding averages 10 days 
create or replace view Last10daysAvgs as 
select b.symbol
,b.tradedqty
,v.avgVolume
,b.last
,v.avgPrice 
,v.low
,v.high
from volumeAvgs10days v
, bhavdata b
where  v.symbol = b.symbol
and b.date = curdate() -1;

# Shares with 10 days low higher than hostoricalAvgprice, close price higher than historical high
#tradeqty greter than avg historical volume
select l.* from Last10daysAvgs l,shares.volumeAvgs v
where l.low > v.avgprice
and l.avgvolume > v.avgVolume * 2
and tradedqty > 100000
and l.symbol = v.symbol
order by tradedqty desc;	


create or replace view stchanges20d as 
select symbol, avg(volchange) avgvolume, sum(pricechange) pricech, min(volume) minvolume from (
select a.symbol,((b.tradedqty-a.tradedqty)/a.tradedqty)*100 volchange,
 ((b.last-b.prevclose)/b.prevclose)*100 pricechange, b.tradedqty as volume,
 b.date
 from 
bhavdata b,
bhavdata a
where a.date=b.date -1
and b.date > curdate() -24
and a.symbol = b.symbol
) q
group by symbol;

create or replace view sharePriceVol as
select a.symbol,avg(tradedqty) avgtrade,
 sum(((a.last-a.prevclose)/a.prevclose)*100) pricechange, max(a.last) maxp, min(a.last) minp,max(date) maxdt, min(date) mindt
 from 
shares.bhavdata a
group by symbol;


select * from shares.stchanges 
where avgvolume > 50 and pricech > 5 and minvolume > 100000
order by minvolume desc;

select c.*,s.pricech from consolidatedHoldings c, stchanges10d s where s.symbol=c.symbol;
