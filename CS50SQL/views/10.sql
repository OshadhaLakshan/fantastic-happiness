-- write a SQL query to answer a question of your choice about the prints. The query should:
    -- Make use of AS to rename a column
    -- Involve at least one condition, using WHERE
    -- Sort by at least one column, using ORDER BY

SELECT "japanese_title" AS 'Name of the creation', "artist" AS 'Creator' FROM "views"
WHERE "contrast" > 0.3
ORDER BY "contrast";
