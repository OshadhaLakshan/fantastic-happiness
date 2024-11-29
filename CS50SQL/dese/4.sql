SELECT "city", COUNT("type")
FROM "schools"
WHERE "type" IS 'Public School'
GROUP BY "city"
ORDER BY COUNT("type") DESC, "city"
LIMIT 10;
