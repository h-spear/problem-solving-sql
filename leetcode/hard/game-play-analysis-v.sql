-- https://leetcode.com/problems/game-play-analysis-v/

SELECT I.install_dt AS install_dt
     , COUNT(I.player_id) AS installs
     , ROUND(COUNT(A.event_date) / COUNT(I.player_id), 2) AS Day1_retention
  FROM (SELECT player_id, MIN(event_date) AS install_dt
          FROM Activity
         GROUP BY player_id) I
  LEFT JOIN Activity A
    ON I.player_id = A.player_id AND 
       DATE_ADD(I.install_dt, INTERVAL 1 DAY) = event_date
 GROUP BY I.install_dt;