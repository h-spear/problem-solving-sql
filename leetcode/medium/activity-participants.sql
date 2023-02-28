-- https://leetcode.com/problems/activity-participants/

WITH Temp AS (
    SELECT activity, COUNT(id) AS count
      FROM Friends
     GROUP BY activity
)

SELECT activity
  FROM Temp
 WHERE count <> (SELECT MAX(count) FROM Temp) AND
       count <> (SELECT MIN(count) FROM Temp);