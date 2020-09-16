-- 1
SELECT
  matchid, player
FROM
  goal
WHERE
  teamid = 'GER';

-- 2
SELECT
  id, stadium, team1, team2
FROM
  game
WHERE
  id = 1012;

-- 3
SELECT
  goal.player, goal.teamid, game.stadium, game.mdate
FROM
  game JOIN goal ON (game.id = goal.matchid)
WHERE
  goal.teamid = 'GER';
  
-- 4
SELECT
  game.team1, game.team2, goal.player
FROM
  game JOIN goal ON (game.id = goal.matchid)
WHERE
  goal.player LIKE 'Mario%';

-- 5
SELECT
  goal.player, goal.teamid, eteam.coach, goal.gtime
FROM
  goal JOIN eteam ON (goal.teamid = eteam.id)
WHERE
  goal.gtime <= 10;

-- 6
SELECT
  game.mdate, eteam.teamname
FROM
  game JOIN eteam ON (team1=eteam.id)
WHERE
  eteam.coach = 'Fernando Santos';

-- 7
SELECT
  goal.player
FROM
  goal JOIN game ON (game.id = goal.matchid)
WHERE
  game.stadium = 'National Stadium, Warsaw';

-- 8
SELECT DISTINCT
  player
FROM
  game JOIN goal ON matchid = id 
WHERE
  goal.teamid != 'GER' AND 'GER' IN (game.team1, game.team2);

-- 9
SELECT
  teamname, COUNT(*)
FROM
  eteam JOIN goal ON id=teamid
GROUP BY
  teamname;

-- 10
SELECT
  stadium, COUNT(*)
FROM
  game JOIN goal ON id = matchid
GROUP BY
  stadium;

-- 11
SELECT
  goal.matchid, game.mdate, COUNT(*)
FROM
  game JOIN goal ON matchid = id 
WHERE
  (team1 = 'POL' OR team2 = 'POL')
GROUP BY
  goal.matchid, game.mdate;

-- 12
SELECT
  goal.matchid, game.mdate, COUNT(*)
FROM
  game JOIN goal ON matchid = id
WHERE
  (goal.teamid = 'GER')
GROUP BY
  goal.matchid, game.mdate;

-- 13
SELECT  
  game.mdate, game.team1,
  SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
  game.team2,
  SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM
  game LEFT JOIN goal ON game.id = goal.matchid
GROUP BY
  game.mdate, game.team1, game.team2
ORDER BY
  game.mdate, goal.matchid;
