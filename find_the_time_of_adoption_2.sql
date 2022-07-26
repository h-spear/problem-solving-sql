-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/59413

SET @hour := -1;

SELECT (@hour := @hour+1) AS HOUR
     , (SELECT COUNT(DATETIME)
          FROM ANIMAL_OUTS
         WHERE HOUR(DATETIME) = @hour)
         
  FROM ANIMAL_OUTS
  
 WHERE @hour < 23