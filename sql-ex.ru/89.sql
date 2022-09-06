-- Найти производителей, у которых больше всего моделей в таблице Product, а также тех, у которых меньше всего моделей.
-- Вывод: maker, число моделей

with max as (
select maker, count(*) cnt
from product
group by maker)

(select maker, cnt
from max
order by cnt desc
limit 1)
union
(select maker, cnt
from max
order by cnt asc
limit 1)
