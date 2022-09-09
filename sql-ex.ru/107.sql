-- Для пятого по счету пассажира из числа вылетевших из Ростова в апреле 2003 года определить компанию, номер рейса и дату вылета.
-- Замечание. Считать, что два рейса одновременно вылететь из Ростова не могут.

select name, trip_no, date
from(
select id_comp, t.trip_no, date,
row_number()over(order by date) rn
from pass_in_trip pit
inner join trip t on t.trip_no=pit.trip_no
where town_from ='Rostov'
and date_part('year', date)=2003
and date_part('month', date)=04
)t
inner join company c on c.id_comp=t.id_comp
where rn=5
