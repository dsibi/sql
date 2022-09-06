-- Определить названия всех кораблей из таблицы Ships, которые удовлетворяют, по крайней мере,
-- комбинации любых четырёх критериев из следующего списка:
-- numGuns = 8
-- bore = 15
-- displacement = 32000
-- type = bb
-- launched = 1915
-- class=Kongo
-- country=USA

select name
from ships s
join classes c on c.class=s.class
where
case when numGuns = 8 then 1 else 0 end +
case when bore = 15 then 1 else 0 end +
case when displacement = 32000 then 1 else 0 end +
case when type = 'bb' then 1 else 0 end +
case when launched = 1915 then 1 else 0 end +
case when c.class='Kongo' then 1 else 0 end +
case when country='USA' then 1 else 0 end >= 4
