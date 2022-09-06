-- В наборе записей из таблицы PC, отсортированном по столбцу code (по возрастанию)
-- найти среднее значение цены для каждой шестерки подряд идущих ПК.
-- Вывод: значение code, которое является первым в наборе из шести строк, среднее значение цены в наборе.

with cte as(
select pc.code, pc.price,
row_number()over(order by code) number
from pc)

select cte.code, avg(c.price)
from cte
join cte c on c.number-cte.number<6 AND c.number-cte.number>=0
group by cte.code, cte.price
having count(c.number)=6
order by 1
