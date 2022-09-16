-- Найти НЕ белые и НЕ черные квадраты, которые окрашены разными цветами в пропорции 1:1:1.
-- Вывод: имя квадрата, количество краски одного цвета

select b_q_id,
sum(case when v_color='R' then b_vol else 0 end) +
sum(case when v_color='G' then b_vol else 0 end) +
sum(case when v_color='B' then b_vol else 0 end) qty
from utb b
join utv v on b.b_v_id=v.v_id
where b_q_id not in(
select b_q_id
from utv v
join utb b on b.b_v_id=v.v_id
group by b_q_id
having
sum(case when v_color='R' then b_vol end)=255
and sum(case when v_color='G' then b_vol end)=255
and sum(case when v_color='B' then b_vol end)=255
union
select q_id
from utq
where q_id not in (select b_q_id from utb))
group by b_q_id
having
sum(case when v_color='R' then b_vol else 0 end)=sum(case when v_color='G' then b_vol else 0 end)
and sum(case when v_color='R' then b_vol else 0 end)=sum(case when v_color='B' then b_vol else 0 end)
and sum(case when v_color='G' then b_vol else 0 end)=sum(case when v_color='B' then b_vol else 0 end)
