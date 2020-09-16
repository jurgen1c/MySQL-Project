-- 1
SELECT
  id, title
FROM
  movie
WHERE
  yr = 1962;

-- 2
SELECT
  yr
FROM
  movie
WHERE
  title = 'Citizen Kane';

-- 3
SELECT
  id, title, yr
FROM
  movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4
SELECT
  id
FROM
  actor
WHERE actor.name = 'Glenn Close';

-- 5
SELECT
  id
FROM
  movie
WHERE
  title = 'Casablanca';

-- 6
SELECT
  actor.name
FROM
  actor JOIN casting ON casting.actorid = actor.id
WHERE
  movieid = 11768;

-- 7
SELECT
  actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  movie.title = 'Alien';

-- 8
SELECT
  movie.title
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  actor.name = 'Harrison Ford';

-- 9
SELECT
  movie.title
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  actor.name = 'Harrison Ford' AND casting.ord != 1;

-- 10
SELECT
  movie.title, actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  casting.ord = 1 AND movie.yr = 1962;

--11
SELECT
  yr,COUNT(title)
FROM
  movie
JOIN
  casting ON movie.id=movieid
JOIN
  actor ON actorid=actor.id
WHERE
  actor.name = 'Rock Hudson'
GROUP BY
  yr
HAVING
  COUNT(title) > 2;
-- 12
SELECT
  movie.title, actor.name
FROM
  actor
INNER JOIN
  casting ON actor.id = casting.actorid
INNER JOIN
  movie ON movie.id = casting.movieid
WHERE
  casting.movieid IN
  (SELECT casting.movieid
  FROM casting
  INNER JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = 'Julie Andrews')
AND casting.ord = 1;

-- 13
SELECT
  actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
JOIN
  movie ON movie.id = casting.movieid
WHERE
  casting.ord  = 1
GROUP BY
  actor.name
HAVING COUNT(*) >= 15;

-- 14
SELECT
  movie.title,
  COUNT(*)
FROM
  movie
JOIN
  casting ON movie.id = casting.movieid
WHERE
  yr = 1978
GROUP BY
  movie.title
ORDER BY
  COUNT(*) DESC, movie.title;

-- 15
SELECT
  actor.name
FROM
  actor
JOIN
  casting ON actor.id = casting.actorid
WHERE
  casting.movieid IN
  (SELECT casting.movieid
  FROM casting
  INNER JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = 'Art Garfunkel')
AND actor.name != 'Art Garfunkel';