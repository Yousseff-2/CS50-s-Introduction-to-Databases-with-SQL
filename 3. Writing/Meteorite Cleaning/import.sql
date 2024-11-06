.import --csv meteorites.csv "meteorites_temp"

CREATE TABLE IF NOT EXISTS "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC
);

UPDATE "meteorites_temp"
SET
    "mass" = NULLIF("mass", ''),
    "year" = NULLIF("year", ''),
    "lat" = NULLIF("lat", ''),
    "long" = NULLIF("long", '');

UPDATE "meteorites_temp"
SET
    "mass" = ROUND("mass", 2),
    "lat"  = ROUND("lat", 2),
    "long" = ROUND("long", 2);

DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long"
FROM "meteorites_temp"
ORDER BY "year", "name";

DROP TABLE "meteorites_temp";
