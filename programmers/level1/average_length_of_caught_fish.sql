-- https://school.programmers.co.kr/learn/courses/30/lessons/293258

SELECT ROUND(AVG(CASE WHEN LENGTH IS NULL THEN 10
                      ELSE LENGTH END), 2) AS AVERAGE_LENGTH
  FROM FISH_INFO;