SELECT
    "schools"."name",
    "districts"."name",
    AVG("graduation_rates"."dropped") AS "avg_dropped_rate",
    AVG("staff_evaluations"."unsatisfactory") AS "avg_unsatisfactory_rate"
FROM
    "schools"
LEFT JOIN
    "districts" ON "schools"."district_id" = "districts"."id"
LEFT JOIN
    "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
LEFT JOIN
    "staff_evaluations" ON "schools"."district_id" = "staff_evaluations"."district_id"
GROUP BY
    "schools"."name", "districts"."name"
HAVING
    AVG("graduation_rates"."dropped") > (
        SELECT AVG("dropped")
        FROM "graduation_rates"
    )
    AND AVG("staff_evaluations"."unsatisfactory") > (
        SELECT AVG("unsatisfactory")
        FROM "staff_evaluations"
    )
ORDER BY
    "avg_unsatisfactory_rate" DESC, "avg_dropped_rate" DESC;
