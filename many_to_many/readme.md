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
1.  All information on the G-rated movies.
1.  The title and release year of every movie, ordered with the oldest movie first.
1.  All information on the 5 longest movies.
1.  A table with columns of `rating` and `total`, tabulating the total number of G, PG, PG-13, and R-rated movies.
1.  A table with columns of `release_year` and `average_runtime`, tabulating the average runtime by year for every movie in the database. The data should be in reverse chronological order (i.e. the most recent year should be first).

### Part 2

In the terminal, let's now add the `stars` data:

```sh
psql < stars.sql
```

As another warmup, write the queries that will show you the following information:

1.  The first and last name of the five oldest stars.
1.  The first and last name of the five youngest stars.
1.  A table of first names along with the number of stars having that first name, provided that this number is greater than 1.
1.  A table of years along with the number of stars born in that year, sorted chronologically.
