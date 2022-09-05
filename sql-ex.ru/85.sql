-- Найти производителей, которые выпускают только принтеры или только PC.
-- При этом искомые производители PC должны выпускать не менее 3 моделей.

select distinct maker
from product
where type='PC'
	   and maker not in (select maker from product
			 where type='Printer' or type='Laptop')
group by maker
having count(model) >= 3
union
select distinct maker
from product
where type='Printer'
and maker not in (select maker from product
			 where type='PC' or type='Laptop')
