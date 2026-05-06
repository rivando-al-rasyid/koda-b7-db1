SELECT
FROM movies
WHERE release_date BETWEEN '2020-01-01' AND '2020-12-31';
-- Find actors whose first names end with 'w' (e.g., Matthew)
SELECT *
FROM actors
WHERE first_name LIKE '%w';
-- Find movies with rating 4-8 released between 2004 and 2010
-- Note: Using explicit date ranges is safer than YEAR() across different SQL dialects
SELECT *
FROM movies
WHERE rating BETWEEN 4 AND 8
    AND release_date >= '2004-01-01'
    AND release_date <= '2010-12-31';