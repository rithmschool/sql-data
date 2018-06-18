# Many To Many Sample Database

The SQL files in this directory feature an example of a many-to-many association. But before digging into many-to-manys, let's review some of the SQL queries we've seen before.

### Part 1

In the terminal, let's run a couple of files to put the `movies` data into a database:

```sh
psql < setup.sql
psql < movies.sql
psql movies_db
```

As a warmup, write the queries that will show you the following information:

1.  The title of every movie.

    ```sql
    SELECT title FROM movies;
    ```

1.  All information on the G-rated movies.

    ```sql
    SELECT * FROM movies
      WHERE rating='G';
    ```

1.  The title and release year of every movie, ordered with the oldest movie first.

    ```sql
    SELECT title, release_year FROM movies
      ORDER BY release_year;
    ```

1.  All information on the 5 longest movies.

    ```sql
    SELECT * FROM movies
      ORDER BY runtime DESC
      LIMIT 5;
    ```

1.  A table with columns of `rating` and `total`, tabulating the total number of G, PG, PG-13, and R-rated movies.

    ```sql
    SELECT rating, COUNT(rating) AS total
      FROM movies
      GROUP BY rating;
    ```

1.  A table with columns of `release_year` and `average_runtime`, tabulating the average runtime by year for every movie in the database. The data should be in reverse chronological order (i.e. the most recent year should be first).

    ```sql
    SELECT release_year, AVG(runtime) AS average_runtime
      FROM movies
      GROUP BY release_year
      ORDER BY release_year DESC;
    ```

### Part 2

In the terminal, let's now add the `stars` data:

```sh
psql < stars.sql
```

As another warmup, write the queries that will show you the following information:

1.  The first and last name of the five oldest stars.

    ```sql
    SELECT first_name, last_name FROM stars
      ORDER BY birth_date
      LIMIT 5;
    ```

1.  The first and last name of the five youngest stars.

    ```sql
    SELECT first_name, last_name FROM stars
      ORDER BY birth_date DESC
      LIMIT 5;
    ```

1.  A table of first names along with the number of stars having that first name, provided that this number is greater than 1.

    ```sql
    SELECT first_name, COUNT(first_name) FROM stars
      GROUP BY first_name
      HAVING COUNT(first_name) > 1;
    ```

1.  A table of years along with the number of stars born in that year, sorted chronologically.

    ```sql
    SELECT EXTRACT(year FROM birth_date) AS birth_year,
      COUNT(EXTRACT(year FROM birth_date))
      FROM stars
      GROUP BY birth_year
      ORDER BY birth_year;
    ```

### Part 3

Now let's explore some basic joins with a 1 to many association!

```
psql < studios.sql
```

Write the queries that will show you the following information:

1.  The movie title and studio name for every movie in the database.

    ```sql
    SELECT title, name FROM movies
      JOIN studios
        ON movies.studio_id = studios.id;
    ```

2.  The names of all studios that have no movie in the database (try to do this with two different queries!)

    ```sql
    -- one way
    SELECT name FROM studios
      LEFT JOIN movies
        ON movies.studio_id = studios.id
      WHERE movies.id IS NULL;

    -- another way
    SELECT name FROM movies
      RIGHT JOIN studios
        ON movies.studio_id = studios.id
      WHERE movies.id IS NULL;
    ```

### Part 4

Once you've learned about many-to-many associations, let's add the `roles` join table:

```sh
psql < roles.sql
```

As an exercise, write the queries that will show you the following information:

1.  The star first name, star last name, and movie title for every matching movie and star pair in the database.

    ```sql
    SELECT s.first_name, s.last_name, m.title
      FROM stars s
      JOIN roles r
        ON s.id = r.star_id
      JOIN movies m
        ON m.id = r.movie_id;
    ```

1.  The first and last names of every star who has been in a G-rated movie.

    ```sql
    SELECT s.first_name, s.last_name
      FROM stars s
      JOIN roles r
        ON s.id = r.star_id
      JOIN movies m
        ON m.id = r.movie_id
      WHERE m.rating = 'G';
    ```

1.  The first and last names of every star along with the number of movies they have been in, in descending order by the number of movies.

    ```sql
    SELECT s.first_name, s.last_name, COUNT(r.movie_id) AS count
      FROM stars s
      JOIN roles r
        ON s.id = r.star_id
      GROUP BY s.first_name, s.last_name
      ORDER BY count DESC;
    ```

1.  The title of every movie along with the number of stars in that movie, in descending order by the number of stars.

    ```sql
    SELECT m.title, COUNT(r.star_id) AS count
      FROM movies m
      JOIN roles r
        ON m.id = r.movie_id
      GROUP BY m.title
      ORDER BY count DESC;
    ```

1.  The first and last names of the five stars whose movies have the longest average runtime.

    ```sql
    SELECT s.first_name, s.last_name, AVG(m.runtime) AS average
      FROM stars s
      JOIN roles r
        ON s.id = r.star_id
      JOIN movies m
        ON m.id = r.movie_id
      GROUP BY s.first_name, s.last_name
      ORDER BY average DESC
      LIMIT 5;
    ```

1.  The first and last names of the five stars whose movies have the longest average runtime, among stars who have more than one movie in the database.

    ```sql
    SELECT s.first_name, s.last_name, AVG(m.runtime) AS average
      FROM stars s
      JOIN roles r
        ON s.id = r.star_id
      JOIN movies m
        ON m.id = r.movie_id
      GROUP BY s.first_name, s.last_name
      HAVING COUNT(m.title) > 1
      ORDER BY average DESC
      LIMIT 5;
    ```

### Part 5

Try writing the following queries using a join that isn't an inner join:

1.  The titles of all movies that don't feature any stars in our database.

    ```sql
    SELECT m.title FROM movies m
      LEFT JOIN roles r
        ON m.id = r.movie_id
      WHERE r.id IS NULL;
    ```

2.  The first and last names of all stars that don't appear in any movies in our database.

    ```sql
    SELECT s.first_name, s.last_name
      FROM roles r
      RIGHT JOIN stars s
        ON s.id = r.star_id
      WHERE r.id is NULL;
    ```

3.  The first names, last names, and titles corresponding to every role in the database, along with every movie title that doesn't have a star, and the first and last names of every star not in a movie.

    ```sql
    SELECT s.first_name, s.last_name, m.title
      FROM stars s
      FULL JOIN roles r
        ON r.star_id = s.id
      FULL JOIN movies m
        on m.id = r.movie_id;
    ```
