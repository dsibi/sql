-- Определить имена разных пассажиров, которые летали
-- только между двумя городами (туда и/или обратно).

with trp as (
select ID_psg, town_from, town_to
from Pass_in_trip 
join Trip on Trip.trip_no = Pass_in_trip.trip_no)

select Passenger.name
from (
select ID_psg, town_from as town
from trp
union
select ID_psg, town_to as town
from trp) tr
join Passenger on Passenger.ID_psg = tr.ID_psg
group by Passenger.name
having count(distinct tr.town) = 2
