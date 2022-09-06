-- Вывести все классы кораблей России (Russia). Если в базе данных нет классов кораблей России, вывести классы для всех имеющихся в БД стран.
-- Вывод: страна, класс

select country, class
from classes
where country=
case when exists(
	select class from classes
	where country='Russia') then 'Russia'
else country end
