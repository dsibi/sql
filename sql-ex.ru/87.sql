-- Считая, что пункт самого первого вылета пассажира является местом жительства, найти не москвичей,
-- которые прилетали в Москву более одного раза.
-- Вывод: имя пассажира, количество полетов в Москву

select name, count(town_to) cnt
from trip t
join pass_in_trip pit on pit.trip_no=t.trip_no
join passenger p on p.id_psg=pit.id_psg
where town_to = 'Moscow'
group by name
having count(pit.id_psg)>1
