CREATE TABLE "movies" (
  "id" int PRIMARY KEY,
  "title" string,
  "release_date" timestamp,
  "rating" float,
  "director_id" int,
  "genre_id" int
);
CREATE TABLE "actors" (
  "id" int PRIMARY KEY,
  "first_name" string,
  "last_name" string
);
CREATE TABLE "movies_actors" (
  "movie_id" int,
  "actor_id" int,
  "role" string
);
CREATE TABLE "directors" (
  "id" int PRIMARY KEY,
  "first_name" string,
  "last_name" string
);
CREATE TABLE "genres" ("id" int PRIMARY KEY, "name" string);
ALTER TABLE "movies_actors"
ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies_actors"
ADD FOREIGN KEY ("actor_id") REFERENCES "actors" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies"
ADD FOREIGN KEY ("director_id") REFERENCES "directors" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "movies"
ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id") DEFERRABLE INITIALLY IMMEDIATE;