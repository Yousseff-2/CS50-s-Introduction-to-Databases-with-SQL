CREATE VIEW "june_vacancies" AS
    SELECT listings.id, listings.property_type, listings.host_name, COUNT(availabilities.date) AS "days_vacant"
    FROM listings
    JOIN availabilities ON listings.id = availabilities.listing_id
    WHERE availabilities.date BETWEEN '2023-06-01' AND '2023-06-30'
    AND availabilities.available = 'TRUE'
    GROUP BY listings.id, listings.property_type, listings.host_name;
