-- На основании информации из таблицы Pass_in_Trip, для каждой авиакомпании определить:
-- 1) количество выполненных перелетов;
-- 2) число использованных типов самолетов;
-- 3) количество перевезенных различных пассажиров;
-- 4) общее число перевезенных компанией пассажиров.
-- Вывод: Название компании, 1), 2), 3), 4).

select name,
count(distinct t.trip_no||date::text) trip_cnt,
count(distinct plane) plane_cnt,
count(distinct id_psg) pass_cnt,
count(id_psg) pass_cnt
from pass_in_trip pit
join trip t on t.trip_no=pit.trip_no
join company c on t.id_comp=c.id_comp
group by name
