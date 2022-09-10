-- Для семи последовательных дней, начиная от минимальной даты, когда из Ростова было совершено максимальное число рейсов,
-- определить число рейсов из Ростова.
-- Вывод: дата, количество рейсов
with RECURSIVE dates AS (
SELECT *, date + INTERVAL '6 days' fin_date
FROM
(SELECT (
SELECT date
FROM
(SELECT date, count(*) cnt
FROM trip t
JOIN pass_in_trip ON pass_in_trip.trip_no = t.trip_no
WHERE town_from='Rostov'
GROUP BY date
ORDER BY cnt DESC)t
LIMIT 1)date
)fd
UNION
SELECT date + INTERVAL '1 day', fin_date
FROM dates
WHERE date < fin_date)

SELECT d.date, count(distinct t.trip_no)
FROM dates d
LEFT JOIN pass_in_trip pit ON pit.date=d.date
LEFT JOIN trip t ON pit.trip_no = t.trip_no
WHERE coalesce(town_from, 'Rostov')='Rostov'
GROUP BY d.date
ORDER BY 1
