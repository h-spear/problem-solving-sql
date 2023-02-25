-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem
-- https://transferhwang.tistory.com/562
-- Oracle은 Median 함수를 지원(MySQL X)

SET @idx = -1;

SELECT ROUND(AVG(LAT_N), 4)
  FROM (SELECT @idx := @idx + 1 AS ROW_NUM
             , LAT_N
          FROM STATION
          ORDER BY LAT_N) AS SUB
 WHERE SUB.ROW_NUM IN (FLOOR(@idx / 2), CEIL(@idx / 2))