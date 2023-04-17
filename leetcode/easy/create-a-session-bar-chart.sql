-- https://leetcode.com/problems/create-a-session-bar-chart/

SELECT bin, COUNT(session_id) AS total
  FROM (SELECT '[0-5>' AS bin, 0 * 60 AS low, 5 * 60 AS high
         UNION ALL
        SELECT '[5-10>' AS bin, 5 * 60 AS low, 10 * 60 AS high
         UNION ALL
        SELECT '[10-15>' AS bin, 10 * 60 AS low, 15 * 60 AS high
         UNION ALL
        SELECT '15 or more' AS bin, 15 * 60 AS low, NULL AS high) Bin
  LEFT JOIN Sessions S 
    ON Bin.low <= S.duration AND
       (Bin.high IS NULL OR Bin.high > S.duration)
 GROUP BY bin;