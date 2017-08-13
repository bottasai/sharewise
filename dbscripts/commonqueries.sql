
select code,count(1) from shares.tradedVolumes where quantitydelivered/quantityTraded > 0.75
and quantityTraded>100000
group by code
having count(1) > 5
order by count(1) desc

select date,count(1) from shares.tradedVolumes group by date

select date,count(1) from shares.bhavdata 
group by date

select * from shares.bhavdata where nooftrades < 100
and close*nooftrades > 1000000

select count(1) from shares.bhavdata

select symbol,((close-open)/last)*100, tradedqty/nooftrades,tradedqty,nooftrades,date from shares.bhavdata 
where symbol = 'AVANTIFEED' order by date desc

select * from shares.bhavdata where symbol = 'AVANTIFEED' order by date desc
