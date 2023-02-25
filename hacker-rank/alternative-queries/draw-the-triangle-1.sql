-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem

SET @cnt = 21;

SELECT REPEAT('* ', @cnt := @cnt - 1)
  FROM INFORMATION_SCHEMA.TABLES
 WHERE @cnt > 0;