SELECT "city", COUNT("type")
FROM "schools"
WHERE "type" IS 'Public School'
GROUP BY "city"
HAVING COUNT("type") <= 3
ORDER BY COUNT("type") DESC, "city";
