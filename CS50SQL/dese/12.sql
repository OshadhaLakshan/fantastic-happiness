SELECT "districts"."name", "expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary"
FROM "districts"
LEFT JOIN "expenditures"
ON "districts"."id" = "expenditures"."district_id"
LEFT JOIN "staff_evaluations"
ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "districts"."name" NOT LIKE '%(District)'
GROUP BY "districts"."name"
HAVING "expenditures"."per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
    )
AND AVG("staff_evaluations"."exemplary") > (
    SELECT AVG("exemplary")
    FROM "staff_evaluations"
    )
ORDER BY "staff_evaluations"."exemplary" DESC, "expenditures"."per_pupil_expenditure" DESC;
