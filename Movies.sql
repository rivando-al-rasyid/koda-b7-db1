CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
CREATE TABLE directors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);
CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  release_date TIMESTAMP,
  rating FLOAT,
  director_id INT,
  genre_id INT,
  CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors(id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id)
);
CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);
CREATE TABLE movies_actors (
  movie_id INT,
  actor_id INT,
  role VARCHAR(255),
  PRIMARY KEY (movie_id, actor_id),
  CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES movies(id),
  CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actors(id)
);