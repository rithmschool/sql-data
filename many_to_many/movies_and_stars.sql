-- in terminal:
-- psql < movies_and_stars.sql
-- psql movies_db
DROP DATABASE IF EXISTS  movies_db;
CREATE DATABASE movies_db;
\c movies_db
CREATE TABLE movies
(
  id SERIAL PRIMARY KEY,
  title TEXT,
  release_year INTEGER,
  runtime INTEGER,
  rating TEXT
);
CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  birth_date DATE
);
CREATE TABLE roles
(
  id SERIAL PRIMARY KEY,
  movie_id INTEGER REFERENCES movies (id) ON DELETE CASCADE,
  star_id INTEGER REFERENCES stars (id) ON DELETE CASCADE
);
INSERT INTO movies
  (title, release_year, runtime, rating)
VALUES
  ('Star Wars: The Force Awakens', 2015, 136, 'PG-13'),
  ('Avatar', 2009, 160, 'PG-13'),
  ('Titanic', 1997, 194, 'PG-13'),
  ('Jurassic World', 2015, 124, 'PG-13'),
  ('Marvel''s The Avengers', 2012, 142, 'PG-13'),
  ('Star Wars: The Last Jedi', 2017, 151, 'PG-13'),
  ('Black Panther', 2018, 140, 'PG-13'),
  ('The Dark Knight', 2008, 150, 'PG-13'),
  ('Rogue One: A Star Wars Story', 2016, 133, 'PG-13'),
  ('Beauty and the Beast', 2017, 129, 'PG'),
  ('Finding Dory', 2016, 103, 'PG'),
  ('Star Wars: Episode I - The Phantom Menace', 1999, 133, 'PG'),
  ('Star Wars', 1977, 121, 'PG'),
  ('Avengers: Age of Ultron', 2015, 141, 'PG-13'),
  ('The Dark Knight Rises', 2012, 165, 'PG-13'),
  ('Shrek 2', 2004, 93, 'PG'),
  ('E. T.: The Extra-Terrestrial', 1982, 117, 'PG'),
  ('The Hunger Games: Catching Fire', 2013, 146, 'PG-13'),
  ('Pirates of the Caribbean: Dead Man''s Chest', 2006, 151, 'PG-13'),
  ('The Lion King', 1994, 89, 'G'),
  ('Toy Story 3', 2010, 103, 'G'),
  ('Wonder Woman', 2017, 141, 'PG-13'),
  ('Captain America: Civil War', 2016, 147, 'PG-13'),
  ('The Hunger Games', 2012, 142, 'PG-13'),
  ('Spider-Man', 2002, 121, 'PG-13'),
  ('Jurassic Park', 1993, 127, 'PG-13'),
  ('Transformers: Revenge of the Fallen', 2009, 144, 'PG-13'),
  ('Frozen', 2013, 108, 'PG'),
  ('Jumanji: Welcome to the Jungle', 2018, 119, 'PG-13'),
  ('Guardians of the Galaxy Vol. 2', 2017, 137, 'PG-13'),
  ('Harry Potter and the Deathly Hallows Part 2', 2011, 130, 'PG-13'),
  ('Finding Nemo', 2003, 104, 'G'),
  ('Star Wars: Episode III - Revenge of the Sith', 2005, 146, 'PG-13'),
  ('The Lord of the Rings: The Return of the King', 2003, 200, 'PG-13'),
  ('Spider-Man 2', 2004, 127, 'PG-13'),
  ('The Passion of the Christ', 2004, 126, 'R'),
  ('The Secret Life of Pets', 2016, 90, 'PG'),
  ('Despicable Me 2', 2013, 98, 'PG'),
  ('The Jungle Book', 2016, 105, 'PG'),
  ('Deadpool', 2016, 106, 'R'),
  ('Inside Out', 2015, 94, 'PG'),
  ('Furious 7', 2015, 137, 'PG-13'),
  ('Transformers: Dark of the Moon', 2011, 154, 'PG-13'),
  ('American Sniper', 2014, 132, 'R'),
  ('The Lord of the Rings: The Two Towers', 2002, 179, 'PG-13'),
  ('Zootopia', 2016, 108, 'PG'),
  ('The Hunger Games: Mockingjay - Part 1', 2014, 123, 'PG-13'),
  ('Spider-Man 3', 2007, 140, 'PG-13'),
  ('Minions', 2015, 91, 'PG'),
  ('Spider-Man: Homecoming', 2017, 133, 'PG-13'),
  ('Alice in Wonderland', 2010, 109, 'PG-13'),
  ('Guardians of the Galaxy', 2014, 121, 'PG-13'),
  ('Batman v Superman: Dawn of Justice', 2016, 151, 'PG-13'),
  ('Forrest Gump', 1994, 141, 'PG-13'),
  ('It', 2017, 135, 'R'),
  ('Suicide Squad', 2016, 130, 'PG-13'),
  ('Shrek the Third', 2007, 92, 'PG'),
  ('Transformers', 2007, 143, 'PG-13'),
  ('Iron Man', 2008, 126, 'PG-13'),
  ('Harry Potter and the Sorcerer''s Stone', 2001, 153, 'PG'),
  ('Indiana Jones and the Kingdom of the Crystal Skull', 2008, 120, 'PG-13'),
  ('The Lord of the Rings: The Fellowship of the Ring', 2001, 178, 'PG-13'),
  ('Thor: Ragnarok', 2017, 130, 'PG-13'),
  ('Iron Man 2', 2010, 125, 'PG-13'),
  ('Star Wars: Episode II - Attack of the Clones', 2002, 132, 'PG-13'),
  ('Pirates of the Caribbean: At World''s End', 2007, 168, 'PG-13'),
  ('Return of the Jedi', 1983, 134, 'PG'),
  ('Independence Day', 1996, 153, 'PG-13'),
  ('Pirates of the Caribbean: The Curse of the Black Pearl', 2003, 135, 'PG-13'),
  ('Skyfall', 2012, 143, 'PG-13'),
  ('The Hobbit: An Unexpected Journey', 2012, 166, 'PG-13'),
  ('Harry Potter and the Half-Blood Prince', 2009, 153, 'PG-13'),
  ('The Twilight Saga: Eclipse', 2010, 124, 'PG-13'),
  ('The Twilight Saga: New Moon', 2009, 130, 'PG-13'),
  ('Harry Potter and the Deathly Hallows Part 1', 2010, 150, 'PG-13'),
  ('The Sixth Sense', 1999, 107, 'PG-13'),
  ('Up', 2009, 96, 'PG'),
  ('Inception', 2010, 148, 'PG-13'),
  ('The Twilight Saga: Breaking Dawn Part 2', 2012, 116, 'PG-13'),
  ('Harry Potter and the Order of the Phoenix', 2007, 139, 'PG-13'),
  ('The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', 2005, 132, 'PG'),
  ('Man of Steel', 2013, 143, 'PG-13'),
  ('The Empire Strikes Back', 1980, 129, 'PG')
  ('Harry Potter and the Goblet of Fire', 2005, 153, 'PG-13')
  ('Monsters, Inc.', 2001, 90, 'G')
  ('Home Alone', 1990, 105, 'PG')
  ('The Hunger Games: Mockingjay - Part 2', 2015, 137, 'PG-13')
  ('The Matrix Reloaded', 2003, 138, 'R')
  ('The Twilight Saga: Breaking Dawn Part 1', 2011, 108, 'PG-13')
  ('Meet the Fockers', 2004, 114, 'PG-13')
  ('The Hangover', 2009, 96, 'R')
  ('Gravity', 2013, 91, 'PG-13')
  ('Sing', 2016, 110, 'PG')
  ('Monsters University', 2013, 107, 'G')
  ('Shrek', 2001, 90, 'PG')
  ('Despicable Me 3', 2017, 90, 'PG')
  ('The Amazing Spider-Man', 2012, 136, 'PG-13')
  ('Harry Potter and the Chamber of Secrets', 2002, 161, 'PG')
  ('The Incredibles', 2004, 115, 'PG');
