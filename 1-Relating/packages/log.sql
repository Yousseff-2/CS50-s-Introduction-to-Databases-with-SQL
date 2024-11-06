--  The Lost Letter --
 SELECT "type","address" FROM addresses WHERE "id"=(
     SELECT "address_id" FROM scans WHERE "driver_id"=(
          SELECT "id" FROM drivers WHERE "name"="Varsha"));
--  The Devious Delivery --
SELECT p.contents, a.type
FROM packages p
JOIN scans s ON p.id = s.package_id
JOIN addresses a ON s.address_id = a.id
WHERE p.from_address_id IS NULL
AND s.action = 'Drop';
--  The Forgotten Gift --
SELECT d.name, p.contents
FROM drivers d
JOIN scans s ON d.id = s.driver_id
JOIN packages p ON s.package_id = p.id
 JOIN addresses a ON p.from_address_id = a.id
 WHERE a.address = '109 Tileston Street'
AND s.action ='Drop';
