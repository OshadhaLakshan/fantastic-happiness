SELECT "schools"."name"
FROM "schools"
LEFT JOIN "graduation_rates"
ON "schools"."id" = "graduation_rates"."school_id"
WHERE "graduation_rates"."graduated" = 100
GROUP BY "schools"."name";
