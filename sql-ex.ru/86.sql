-- Для каждого производителя перечислить в алфавитном порядке с разделителем "/" все типы выпускаемой им продукции.
-- Вывод: maker, список типов продукции

select maker, string_agg(distinct type, '/' order by type)
from product
group by maker
