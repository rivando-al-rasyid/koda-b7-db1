SELECT m.title,
    m.release_date,
    m.rating,
    d.first_name AS director_full_name,
    g.name AS genre
FROM movies m
    JOIN directors d ON m.director_id = d.id
    JOIN genres g ON m.genre_id = g.id
ORDER BY m.rating DESC,
    m.release_date DESC
LIMIT 50;
SELECT m.title,
    m.release_date,
    m.rating,
    a.first_name AS actor_name,
    ma.role
FROM movies m
    JOIN movies_actors ma ON m.id = ma.movie_id
    JOIN actors a ON ma.actor_id = a.id
ORDER BY m.rating DESC;