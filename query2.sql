SELECT m.title,
    m.release_date,
    m.rating,
    d.first_name AS director,
    g.name AS genre
FROM movies m
    JOIN directors d ON m.director_id = d.id
    JOIN genres g ON m.genre_id = g.id
ORDER BY m.rating DESC
LIMIT 50;
SELECT m.title,
    m.release_date,
    m.rating,
    a.first_name AS actor_name
FROM movies m
    JOIN actors a ON m.actor_id = a.id
ORDER BY m.rating DESC
LIMIT 50;