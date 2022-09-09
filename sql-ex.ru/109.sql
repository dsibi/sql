-- Вывести:
-- 1. Названия всех квадратов черного или белого цвета.
-- 2. Общее количество белых квадратов.
-- 3. Общее количество черных квадратов.

select q_name,
sum(case when color='white' then 1 end) over() whites,
sum(case when color='black' then 1 end) over() blacks
from(
select q_name, 'white' color
from utb b
join utv v on v.v_id=b.b_v_id
join utq q on q.q_id=b.b_q_id
group by q_name
having
sum(case when v_color='R' then b_vol end)=255
and sum(case when v_color='G' then b_vol end)=255
and sum(case when v_color='B' then b_vol end)=255
union
select q_name, 'black' color
from(
select q_id
from utq
except
select b_q_id
from utb)t
join utq q on q.q_id=t.q_id
order by 1)t1
group by q_name, color
order by 1
