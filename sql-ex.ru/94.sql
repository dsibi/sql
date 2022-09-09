-- Для семи последовательных дней, начиная от минимальной даты,
-- когда из Ростова было совершено максимальное число рейсов, определить число рейсов из Ростова.
-- Вывод: дата, количество рейсов

WITH RECURSIVE cte AS(
select min(date) date,
min(date) + interval '6 days' fin_date
from pass_in_trip pit
join trip t on t.trip_no=pit.trip_no
where town_from='Rostov'
UNION
select date+interval '1 day', fin_date
from cte c
where date + interval '1 day' <= fin_date
)

SELECT cte.date, count(distinct t.trip_no) cnt
FROM cte
left join pass_in_trip pit on pit.date=cte.date
left join trip t on t.trip_no=pit.trip_no
where coalesce(town_from, 'Rostov')='Rostov'
group by cte.date
order by 1
