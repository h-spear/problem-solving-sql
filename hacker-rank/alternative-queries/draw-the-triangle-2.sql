-- https://www.hackerrank.com/challenges/draw-the-triangle-2/problem

SET @cnt = 0;

SELECT REPEAT('* ', @cnt := @cnt + 1)
  FROM INFORMATION_SCHEMA.TABLES
 WHERE @cnt < 20;