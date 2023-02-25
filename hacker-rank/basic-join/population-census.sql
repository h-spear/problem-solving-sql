-- https://www.hackerrank.com/challenges/asian-population/problem

SELECT SUM(CI.POPULATION)
  FROM CITY CI, COUNTRY CO
 WHERE CI.COUNTRYCODE = CO.CODE AND 
       CONTINENT = 'Asia'