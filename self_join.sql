-- 1
SELECT
  COUNT(stops.id)
FROM
  stops;

-- 2
SELECT
  stops.id
FROM
  stops
WHERE
  stops.name = 'Craiglockhart';

-- 3
SELECT
  stops.id, stops.name
FROM
  stops, route
WHERE
  stops.id = route.stop AND route.company = 'LRT' AND route.num = '4';

-- 4
SELECT
  company, num, COUNT(*)
FROM
  route 
WHERE
  stop = 149 OR stop = 53
GROUP BY
  company, num
HAVING
  COUNT(*) > 1;

-- 5
SELECT
  a.company, a.num, a.stop, b.stop
FROM
  route a JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE
  a.stop = 53 AND b.stop = 149;

-- 6
SELECT
  a.company, a.num, stopa.name, stopb.name
FROM
  route a JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN
  stops stopa ON (a.stop = stopa.id)
JOIN
  stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

-- 7
SELECT DISTINCT
  a.company, a.num
FROM
  route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN
  stops stopa ON (a.stop=stopa.id)
JOIN
  stops stopb ON (b.stop=stopb.id)
WHERE
  stopa.name='Haymarket' AND stopb.name = 'Leith';

-- 8
SELECT DISTINCT
  a.company, a.num
FROM
  route a JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN
  stops stopa ON (a.stop = stopa.id)
JOIN
  stops stopb ON (b.stop = stopb.id)
WHERE
  stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

--9
SELECT DISTINCT
  stopb.name, b.company, b.num
FROM
  route AS a
JOIN
  route AS b ON a.company = b.company AND a.num = b.num
JOIN
  stops AS stopa ON a.stop = stopa.id
JOIN
  stops AS stopb ON b.stop = stopb.id
WHERE
  stopa.name = 'Craiglockhart' AND a.company = 'LRT';

--10
SELECT
  a.num AS Num1, a.comp AS Comp1, a.transfer AS Transfer, b.num AS Num2, b.comp AS Comp2
FROM
  (SELECT DISTINCT a.num AS num, a.company AS comp, stopb.name AS transfer
  FROM
    route AS a
  JOIN
    route AS b ON a.company = b.company AND a.num = b.num
  JOIN
    stops AS stopa ON a.stop = stopa.id
  JOIN
    stops AS stopb ON b.stop = stopb.id
  WHERE
    stopa.name = 'Craiglockhart') AS a
  JOIN
  (SELECT DISTINCT a.num AS num, a.company AS comp, stopb.name AS transfer
  FROM
    route AS a
  JOIN
    route AS b ON a.company = b.company AND a.num = b.num
  JOIN
    stops AS stopa ON a.stop = stopa.id
  JOIN
    stops AS stopb ON b.stop = stopb.id
  WHERE
    stopa.name = 'Lochend') AS b ON a.transfer = b.transfer
ORDER BY
  Num1,Transfer, Num2;