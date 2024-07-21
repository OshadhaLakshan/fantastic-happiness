
-- *** The Lost Letter ***
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
    SELECT "to_address_id" FROM "packages"
    WHERE "id" = (
        SELECT "package_id" FROM "scans"
        WHERE "address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '900 Somerville Avenue'
        )
    )
);


-- *** The Devious Delivery ***
-- Query to find the missing package related to baths

-- Find the current location of the package
SELECT a.address, a.type
FROM addresses a
JOIN scans s ON a.id = s.address_id
WHERE s.package_id = (
    SELECT id FROM packages
    WHERE from_address_id IS NULL
)
ORDER BY s.timestamp DESC;

SELECT "contents" FROM "packages"
WHERE "from_address_id" IS NULL;


-- *** The Forgotten Gift ***
SELECT "contents" FROM "packages"
WHERE "id" = (
    SELECT "id" FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
);

SELECT "name" FROM "drivers"
WHERE "id" = (
    SELECT "driver_id" FROM "scans"
    WHERE "id" = (
        SELECT "package_id" FROM "scans"
        WHERE "address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
    )
);


