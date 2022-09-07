-- Для каждой компании, перевозившей пассажиров, подсчитать время, которое провели в полете самолеты с пассажирами.
-- Вывод: название компании, время в минутах.

select c.name comp_name,
round(EXTRACT(EPOCH FROM sum(case when time_in-time_out<'00:00:00' then time_in-time_out+'24:00:00'
else time_in-time_out end)/60)) mins
from trip t
join (select distinct trip_no, date from pass_in_trip) pit on pit.trip_no=t.trip_no
join company c on c.id_comp=t.id_comp
group by comp_name
