-- Для каждого класса крейсеров, число орудий которого известно, пронумеровать (последовательно от единицы) все орудия.
-- Вывод: имя класса, номер орудия в формате 'bc-N'.

select class, 'bc-'||rn as num
from (
select 
cl.class, 
cl.numguns, 
row_number () over (partition by cl.class order by cl.class) as rn
from classes cl
cross join classes cl2
where cl.type = 'bc') a
where rn <= numguns
