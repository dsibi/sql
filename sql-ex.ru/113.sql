-- Сколько каждой краски понадобится, чтобы докрасить все Не белые квадраты до белого цвета.
-- Вывод: количество каждой краски в порядке (R,G,B)

select sum(r) r,
sum(g) g,
sum(b) b
from(
select b_q_id,
255-sum(case when v_color='R' then b_vol else 0 end) r,
255-sum(case when v_color='G' then b_vol else 0 end) g,
255-sum(case when v_color='B' then b_vol else 0 end) b
from utb b
join utv v on v.v_id=b.b_v_id
where b_q_id not in(
select b_q_id
from utb b
join utv v on v.v_id=b.b_v_id
group by b_q_id
having
sum(case when v_color='R' then b_vol end)=255
and sum(case when v_color='G' then b_vol end)=255
and sum(case when v_color='B' then b_vol end)=255)
group by b_q_id
union
select q_id, 255 r, 255 g, 255 b
from utq
where q_id not in(select b_q_id from utb))u
