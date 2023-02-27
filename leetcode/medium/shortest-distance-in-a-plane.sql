-- https://leetcode.com/problems/shortest-distance-in-a-plane/

WITH Point2DWithIndices AS (
    SELECT x, y, @val := @val + 1 AS idx
      FROM Point2D, (SELECT @val := 0) AS Var
)

SELECT ROUND(SQRT((P1.x - P2.x) * (P1.x - P2.x) + (P1.y - P2.y) * (P1.y - P2.y)), 2) AS shortest
  FROM Point2DWithIndices P1 
  JOIN Point2DWithIndices P2
    ON P1.idx <> P2.idx
 ORDER BY shortest
 LIMIT 1;