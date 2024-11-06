SELECT COUNT(*)
FROM episodes
WHERE air_date >= '2008-01-01' AND air_date < '2009-01-01' AND topic LIKE '%math%';
