-- Выбрать все белые квадраты, которые окрашивались только из баллончиков,
-- пустых к настоящему времени. Вывести имя квадрата

select q_name
from utb b
join utv v on v.v_id=b.b_v_id
join utq q on q.q_id=b.b_q_id
where b_v_id not in
(select b_v_id
from utb
group by b_v_id
having sum(b_vol)<>255)
group by q_name
having sum (case when v_color='R' then b_vol else 0 end) = 255
and sum (case when v_color='G' then b_vol else 0 end) = 255
and sum (case when v_color='B' then b_vol else 0 end) = 255
order by 1
