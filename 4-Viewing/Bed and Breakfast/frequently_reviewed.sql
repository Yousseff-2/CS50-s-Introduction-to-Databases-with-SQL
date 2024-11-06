CREATE VIEW "frequently_reviewed" AS
    SELECT L.id , L.property_type , L.host_name,
    COUNT("reviews") AS "reviews" FROM listings L
    JOIN reviews R ON L.id = R.listing_id
    GROUP BY R.listing_id ORDER BY "reviews" DESC , L.property_type , L.host_name
     LIMIT 100;