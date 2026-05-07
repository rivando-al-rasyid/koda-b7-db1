--  counting gendres
SELECT d.first_name AS director_name,
    COUNT(g.id) AS genre_count
FROM movies m
    INNER JOIN directors d ON m.director_id = d.id
    INNER JOIN genres g ON m.genre_id = g.id
GROUP BY d.id,
    d.first_name
ORDER BY d.first_name ASC;
-- counting role
SELECT a.first_name AS actor_name,
    COUNT(ma.role) AS total_role
FROM movies m
    JOIN movies_actors ma ON m.id = ma.movie_id
    JOIN actors a ON ma.actor_id = a.id
GROUP BY a.id
HAVING COUNT(ma.role) > 5
ORDER BY actor_name;
--  counting movie
SELECT d.first_name AS director_name,
    COUNT(m.id) AS movie_count
FROM movies m
    INNER JOIN directors d ON m.director_id = d.id
    INNER JOIN genres g ON m.genre_id = g.id
GROUP BY d.id,
    d.first_name
ORDER BY d.first_name ASC;
--  counting most movie making year
SELECT YEAR(m.release_date) AS tahun,
    COUNT(m.id) AS jumlah_film
FROM movies m
GROUP BY YEAR(m.release_date)
ORDER BY jumlah_film DESC
LIMIT 1;
--- movie and their actor
SELECT m.title,
    m.release_date,
    m.rating,
    STRING_AGG(
        a.first_name || ' ' || a.last_name,
        ', '
        ORDER BY a.first_name ASC
    ) AS actors_list
FROM movies m
    INNER JOIN movies_actors ma ON m.id = ma.movie_id
    INNER JOIN actors a ON ma.actor_id = a.id
GROUP BY m.id,
    m.title,
    m.release_date,
    m.rating
ORDER BY m.title ASC;