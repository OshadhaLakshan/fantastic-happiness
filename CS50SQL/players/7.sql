SELECT COUNT(*) AS Count FROM "players"
WHERE ("bats" = 'R' AND "throws" = 'L') OR ("bats" = 'L' AND "throws" = 'R');
