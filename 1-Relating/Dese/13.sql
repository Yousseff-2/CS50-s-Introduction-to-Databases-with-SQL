SELECT districts.name AS district_name, AVG(graduation_rates.graduated) AS avg_graduation_rate
FROM districts
JOIN schools ON districts.id = schools.district_id
JOIN graduation_rates ON schools.id = graduation_rates.school_id
GROUP BY districts.name
HAVING AVG(graduation_rates.graduated) > (
    SELECT AVG(graduated)
    FROM graduation_rates
);
