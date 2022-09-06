-- Для тех производителей, у которых есть продукты с известной ценой хотя бы в одной из таблиц Laptop, PC,
-- Printer найти максимальные цены на каждый из типов продукции.
-- Вывод: maker, максимальная цена на ноутбуки, максимальная цена на ПК, максимальная цена на принтеры.
-- Для отсутствующих продуктов/цен использовать NULL.

select maker
, coalesce (max(l.price), null) l_max
, coalesce (max(pc.price), null) pc_max
, coalesce (max(pr.price), null) pr_max
from product p
left join pc on pc.model=p.model
left join laptop l on l.model=p.model
left join printer pr on pr.model=p.model
group by maker
order by 1
