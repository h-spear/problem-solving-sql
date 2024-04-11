-- level2
-- https://school.programmers.co.kr/learn/courses/30/lessons/293257

SELECT COUNT(FI.ID) AS FISH_COUNT
     , FNI.FISH_NAME AS FISH_NAME
  FROM FISH_INFO FI
  LEFT JOIN FISH_NAME_INFO FNI
    ON FI.FISH_TYPE = FNI.FISH_TYPE
 GROUP BY FNI.FISH_NAME
 ORDER BY FISH_COUNT DESC;
 