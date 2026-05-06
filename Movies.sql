CREATE TABLE "movies" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "release_date" timestamp,
  "rating" float,
  "director_id" int,
  "genre_id" int
);
CREATE TABLE "actors" (
  "id" int PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);
CREATE TABLE "movies_actors" (
  "movie_id" int,
  "actor_id" int,
  "role" varchar
);
CREATE TABLE "directors" (
  "id" int PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);
CREATE TABLE "genres" ("id" int PRIMARY KEY, "name" varchar);
ALTER TABLE "movies_actors"
ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies_actors"
ADD FOREIGN KEY ("actor_id") REFERENCES "actors" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies"
ADD FOREIGN KEY ("director_id") REFERENCES "directors" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies"
ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id") DEFERRABLE INITIALLY IMMEDIATE;
-- Populating Genres
INSERT INTO "genres" ("id", "name")
VALUES (1, 'Sci-Fi'),
  (2, 'Drama'),
  (3, 'Comedy');
-- Populating Directors
INSERT INTO "directors" ("id", "first_name", "last_name")
VALUES (1, 'Christopher', 'Nolan'),
  (2, 'Greta', 'Gerwig');
-- Populating Actors
INSERT INTO "actors" ("id", "first_name", "last_name")
VALUES (1, 'Matthew', 'McConaughey'),
  (2, 'Anne', 'Hathaway'),
  (3, 'Margot', 'Robbie'),
  (4, 'Ryan', 'Gosling');
SELECT *
FROM movies
WHERE release_date BETWEEN '2020-01-01' AND '2020-12-31';
SELECT *
FROM actors
WHERE first_name LIKE '%s';
SELECT *
FROM movies
WHERE rating BETWEEN 4 and 8
  AND YEAR(release_date) BETWEEN 2004 and 2010;