select b.symbol,last,(last-open)/open*100,b.tradedqty, v.avgvolume from shares.bhavdata b,shares.volumeAvgs v 
where date > curdate() -2
and (last-open)/open*100 > 3
and b.tradedqty > v.avgvolume * 2
and b.symbol = v.symbol
and b.last > v.HIGH
#and b.last < v.avgprice * 1.1
order by tradedqty desc

select * from shares.volumeAvgs

create or replace view shares.volumeAvgs as 
	select symbol,avg(tradedqty)  avgvolume, avg(last) avgprice, max(last) high, min(last) low
from shares.bhavdata 
where date < curdate()-1
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
and b.date = curdate() -1

select a.instrument,a.avgvolume from shares.holdingsAvgs a
 where  a.last < a.avgprice*0.9

select * from shares.volumeAvgs where symbol in (
select trim(instrument) from shares.shareholdings)

select * from shares.volumeAvgs where symbol = 'BHAGERIA'
select instrument from shares.shareholdings where trim(instrument) = 'AUROPHARMA'
