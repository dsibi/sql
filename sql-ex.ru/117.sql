-- По таблице Classes для каждой страны найти максимальное значение среди трех выражений:
-- numguns*5000, bore*3000, displacement.
-- Вывод в три столбца:
-- - страна;
-- - максимальное значение;
-- - слово `numguns` - если максимум достигается для numguns*5000, слово `bore` - если максимум достигается для bore*3000,
-- слово `displacement` - если максимум достигается для displacement.
-- Замечание. Если максимум достигается для нескольких выражений, выводить каждое из них отдельной строкой.

with cta as (
select country, name, value, max(value) over(partition by country) max_value
from(
SELECT country, name, value FROM classes
CROSS JOIN LATERAL
(VALUES('numguns', numguns*5000)
,('bore', bore*3000)
,('displacement', displacement)
) spec(name, value)
ORDER BY country, name, value)t)

select distinct country, value max_val, name
from cta
where max_value = value
ORDER BY country, name, value
