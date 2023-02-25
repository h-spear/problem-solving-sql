-- https://www.hackerrank.com/challenges/weather-observation-station-12/problem

SELECT DISTINCT CITY
  FROM STATION
 WHERE CITY NOT REGEXP '^[AEIOU]' AND
       CITY NOT REGEXP '[AEIOU]$'