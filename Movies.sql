-- 1. Table Creation
CREATE TABLE "genres" ("id" int PRIMARY KEY, "name" varchar);
CREATE TABLE "directors" (
  "id" int PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);
CREATE TABLE "actors" (
  "id" int PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar
);
CREATE TABLE "movies" (
  "id" int PRIMARY KEY,
  "title" varchar,
  "release_date" timestamp,
  "rating" float,
  "director_id" int,
  "genre_id" int
);
-- Junction table for Many-to-Many relationship
CREATE TABLE "movies_actors" (
  "movie_id" int,
  "actor_id" int,
  "role" varchar,
  PRIMARY KEY ("movie_id", "actor_id")
);
-- 2. Establishing Relationships
ALTER TABLE "movies_actors"
ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies_actors"
ADD FOREIGN KEY ("actor_id") REFERENCES "actors" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies"
ADD FOREIGN KEY ("director_id") REFERENCES "directors" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies"
ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id") DEFERRABLE INITIALLY IMMEDIATE;
-- 3. Data Population
INSERT INTO "genres" ("id", "name")
VALUES (1, 'Sci-Fi'),
  (2, 'Drama'),
  (3, 'Comedy');
INSERT INTO "directors" ("id", "first_name", "last_name")
VALUES (1, 'Christopher', 'Nolan'),
  (2, 'Greta', 'Gerwig');
INSERT INTO "actors" ("id", "first_name", "last_name")
VALUES (1, 'Matthew', 'McConaughey'),
  (2, 'Anne', 'Hathaway'),
  (3, 'Margot', 'Robbie'),
  (4, 'Ryan', 'Gosling');
-- Populating Movies (Filling the gap in the original snippet)
INSERT INTO "movies" (
    "id",
    "title",
    "release_date",
    "rating",
    "director_id",
    "genre_id"
  )
VALUES (
    1,
    'Interstellar',
    '2014-11-07 00:00:00',
    8.7,
    1,
    1
  ),
  (2, 'Barbie', '2023-07-21 00:00:00', 7.0, 2, 3),
  (3, 'Tenet', '2020-08-26 00:00:00', 7.5, 1, 1),
  (4, 'Inception', '2010-07-16 00:00:00', 8.8, 1, 1);
-- Populating Junction Table
INSERT INTO "movies_actors" ("movie_id", "actor_id", "role")
VALUES (1, 1, 'Cooper'),
  (1, 2, 'Brand'),
  (2, 3, 'Barbie'),
  (2, 4, 'Ken');