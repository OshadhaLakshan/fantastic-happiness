SELECT "districts"."name", "expenditures"."per_pupil_expenditure"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
WHERE "districts"."name" NOT LIKE '%(District)'
GROUP BY "districts"."name", "expenditures"."per_pupil_expenditure"
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10;
