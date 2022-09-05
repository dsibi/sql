-- Для каждой компании подсчитать количество перевезенных пассажиров (если они были в этом месяце) по декадам апреля 2003.
-- При этом учитывать только дату вылета.
-- Вывод: название компании, количество пассажиров за каждую декаду

select name, sum(i_dec) i_dec, sum(ii_dec) ii_dec, sum(iii_dec) iii_dec
from(
select name,id_psg,date,
case when EXTRACT(day FROM date)<=10 then 1 else 0 end i_dec,
case when EXTRACT(day FROM date)>10 and EXTRACT(day FROM date)<=20 then 1 else 0 end ii_dec,
case when EXTRACT(day FROM date)>20 then 1 else 0 end iii_dec
from Company 
inner join Trip on Company.ID_comp=trip.ID_comp
inner join Pass_in_trip on Pass_in_trip.trip_no=trip.trip_no
where EXTRACT(MONTH FROM date)=4 and EXTRACT(YEAR FROM date)=2003)g
group by name
