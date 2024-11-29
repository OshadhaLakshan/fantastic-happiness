SELECT "schools"."name", "expenditures"."per_pupil_expenditure", "graduation_rates"."graduated"
FROM "schools"
LEFT JOIN "graduation_rates"
ON "schools"."id" = "graduation_rates"."school_id"
LEFT JOIN "districts"
ON "districts"."id" = "schools"."district_id"
LEFT JOIN "expenditures"
ON "districts"."id" = "expenditures"."district_id"
WHERE "expenditures"."per_pupil_expenditure" IS NOT NULL
AND "graduation_rates"."graduated" IS NOT NULL
GROUP BY "schools"."name", "expenditures"."per_pupil_expenditure", "graduation_rates"."graduated"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name";
