-- Определить имена разных пассажиров, которым чаще других доводилось лететь на одном и том же месте.
-- Вывод: имя и количество полетов на одном и том же месте.

with pivot as (
select id_psg, place, count(place) cnt
from pass_in_trip
group by id_psg, place
)

select name, cnt
from pivot
join passenger p on p.id_psg=pivot.id_psg
where cnt=(select max(cnt) from pivot)
