SELECT COUNT("english_title") FROM "views"
WHERE "artist" IS 'Hokusai'
    AND "english_title" LIKE '%Fuji%';
