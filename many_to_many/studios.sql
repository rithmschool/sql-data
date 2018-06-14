\c movies_db
ALTER TABLE IF EXISTS movies 
  DROP COLUMN IF EXISTS studio_id;

DROP TABLE IF EXISTS studios;

CREATE TABLE studios
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  start_date DATE
);

INSERT INTO studios
  (name, start_date)
VALUES
  ('Walt Disney Studios Motion Pictures', '1953-06-23'),
  ('20th Century Fox', '1935-05-31'),
  ('Paramount Pictures', '1912-05-08'),
  ('Universal Pictures', '1912-04-30'),
  ('Warner Bros.', '1923-04-04'),
  ('Dreamworks SKG', '1994-10-12'),
  ('Lionsgate', '1997-07-10'),
  ('Sony / Columbia Pictures', '1924-01-10'),
  ('New Line Cinema', '1967-01-01'),
  ('Newmarket Films', '1994-01-01'),
  ('Summit Entertainment', '1991-07-26'),
  ('Orion Pictures', '1978-01-01'),
  ('Sony Pictures Classics', '1992-01-01');

ALTER TABLE movies
  ADD COLUMN studio_id INTEGER REFERENCES studios;

UPDATE movies 
  SET studio_id=1
WHERE id IN (1, 5, 6, 7, 9, 10, 11, 14, 19, 20, 21, 23, 24, 29, 31, 33, 40, 42, 47, 52, 53, 64, 67, 70, 77, 78, 82, 86, 95, 100);

UPDATE movies
  SET studio_id=2
WHERE id in (2, 12, 13, 34, 41, 66, 68, 69, 84, 87);

UPDATE movies
  SET studio_id=3
WHERE id in (3, 28, 44, 55, 58, 59, 60, 62, 65);

UPDATE movies
  SET studio_id=4
WHERE id in (4, 17, 27, 38, 39, 43, 50, 91, 94, 97);

UPDATE movies
  SET studio_id=5
WHERE id in (8, 15, 22, 32, 45, 54, 56, 57, 61, 72, 73, 76, 79, 81, 83, 85, 89, 92, 93, 99);

UPDATE movies
  SET studio_id=6
WHERE id in (16, 96);

UPDATE movies
  SET studio_id=7
WHERE id in (18, 25, 48, 80, 88);

UPDATE movies
  SET studio_id=8
WHERE id in (26, 30, 36, 49, 51, 71, 98);

UPDATE movies
  SET studio_id=9
WHERE id in (35, 46, 63);

UPDATE movies
  SET studio_id=10
WHERE id in (37);

UPDATE movies
  SET studio_id=11
WHERE id in (74, 75, 90);

ALTER TABLE movies
  ADD CONSTRAINT fk_studio
  FOREIGN KEY (studio_id)
  REFERENCES studios(id);