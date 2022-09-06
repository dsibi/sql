-- Найти производителей любой компьютерной техники, у которых нет моделей ПК, не представленных в таблице PC.

select distinct maker
from product
except
select maker
from product
where type='PC' and model not in(
select model from pc)
