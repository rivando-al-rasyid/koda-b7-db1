-- Genres
INSERT INTO genres (name)
VALUES ('Action'),
    ('Drama'),
    ('Comedy'),
    ('Sci-Fi'),
    ('Horror');
-- Directors
INSERT INTO directors (first_name, last_name)
VALUES ('Christopher', 'Nolan'),
    ('Steven', 'Spielberg'),
    ('Quentin', 'Tarantino'),
    ('James', 'Cameron'),
    ('Martin', 'Scorsese');
-- Actors
INSERT INTO actors (first_name, last_name)
VALUES ('Leonardo', 'DiCaprio'),
    ('Joseph', 'Gordon-Levitt'),
    ('Liam', 'Neeson'),
    ('Jeff', 'Goldblum'),
    ('John', 'Travolta'),
    ('Uma', 'Thurman'),
    ('Kate', 'Winslet'),
    ('Sam', 'Worthington'),
    ('Matt', 'Damon'),
    ('Ray', 'Liotta');
-- Movies
INSERT INTO movies (
        title,
        release_date,
        rating,
        director_id,
        genre_id
    )
VALUES (
        'Inception',
        '2010-07-16',
        8.8,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Christopher'
                AND last_name = 'Nolan'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Sci-Fi'
        )
    ),
    (
        'Interstellar',
        '2014-11-07',
        8.6,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Christopher'
                AND last_name = 'Nolan'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Sci-Fi'
        )
    ),
    (
        'Schindler''s List',
        '1993-12-15',
        8.9,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Steven'
                AND last_name = 'Spielberg'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Drama'
        )
    ),
    (
        'Jurassic Park',
        '1993-06-11',
        8.1,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Steven'
                AND last_name = 'Spielberg'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Action'
        )
    ),
    (
        'Pulp Fiction',
        '1994-10-14',
        8.9,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Quentin'
                AND last_name = 'Tarantino'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Drama'
        )
    ),
    (
        'Kill Bill Vol. 1',
        '2003-10-10',
        8.1,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Quentin'
                AND last_name = 'Tarantino'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Action'
        )
    ),
    (
        'Titanic',
        '1997-12-19',
        7.9,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'James'
                AND last_name = 'Cameron'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Drama'
        )
    ),
    (
        'Avatar',
        '2009-12-18',
        7.8,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'James'
                AND last_name = 'Cameron'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Sci-Fi'
        )
    ),
    (
        'The Departed',
        '2006-10-06',
        8.5,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Martin'
                AND last_name = 'Scorsese'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Action'
        )
    ),
    (
        'Goodfellas',
        '1990-09-19',
        8.7,
        (
            SELECT id
            FROM directors
            WHERE first_name = 'Martin'
                AND last_name = 'Scorsese'
        ),
        (
            SELECT id
            FROM genres
            WHERE name = 'Drama'
        )
    );
-- Movies_Actors
INSERT INTO movies_actors (movie_id, actor_id, role)
VALUES -- Inception
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Inception'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Leonardo'
                AND last_name = 'DiCaprio'
        ),
        'Dom Cobb'
    ),
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Inception'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Joseph'
                AND last_name = 'Gordon-Levitt'
        ),
        'Arthur'
    ),
    -- Interstellar
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Interstellar'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Leonardo'
                AND last_name = 'DiCaprio'
        ),
        'Cooper'
    ),
    -- Schindler's List
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Schindler''s List'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Liam'
                AND last_name = 'Neeson'
        ),
        'Oskar Schindler'
    ),
    -- Jurassic Park
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Jurassic Park'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Jeff'
                AND last_name = 'Goldblum'
        ),
        'Dr. Ian Malcolm'
    ),
    -- Pulp Fiction
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Pulp Fiction'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'John'
                AND last_name = 'Travolta'
        ),
        'Vincent Vega'
    ),
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Pulp Fiction'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Uma'
                AND last_name = 'Thurman'
        ),
        'Mia Wallace'
    ),
    -- Kill Bill Vol. 1
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Kill Bill Vol. 1'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Uma'
                AND last_name = 'Thurman'
        ),
        'The Bride'
    ),
    -- Titanic
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Titanic'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Leonardo'
                AND last_name = 'DiCaprio'
        ),
        'Jack Dawson'
    ),
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Titanic'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Kate'
                AND last_name = 'Winslet'
        ),
        'Rose DeWitt Bukater'
    ),
    -- Avatar
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Avatar'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Sam'
                AND last_name = 'Worthington'
        ),
        'Jake Sully'
    ),
    -- The Departed
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'The Departed'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Leonardo'
                AND last_name = 'DiCaprio'
        ),
        'Billy Costigan'
    ),
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'The Departed'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Matt'
                AND last_name = 'Damon'
        ),
        'Colin Sullivan'
    ),
    -- Goodfellas
    (
        (
            SELECT id
            FROM movies
            WHERE title = 'Goodfellas'
        ),
        (
            SELECT id
            FROM actors
            WHERE first_name = 'Ray'
                AND last_name = 'Liotta'
        ),
        'Henry Hill'
    );