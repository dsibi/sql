-- C точностью до двух десятичных знаков определить среднее количество краски на квадрате.

select round(avg(sum),2)
from(
select q_id, sum(coalesce(b_vol,0)) sum
from utq q
left join utb b on b.b_q_id=q.q_id
group by q_id)t
