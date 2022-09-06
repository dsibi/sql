-- Вывести все строки из таблицы Product, кроме трех строк с наименьшими номерами моделей и трех строк с наибольшими номерами моделей.

select *
from product
where model not in(
(select model
from product
order by model asc
limit 3)
union
(select model
from product
order by model desc
limit 3))
