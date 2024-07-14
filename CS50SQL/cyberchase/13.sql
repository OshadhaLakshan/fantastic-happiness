-- write a SQL query to explore a question of your choice.
-- titles and airdates of episodes that were aired in October.
SELECT "title", "air_date" FROM "episodes"
WHERE "air_date" LIKE '20%-10-%';
