-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

SELECT CO.CONTINENT
     , FLOOR(AVG(CI.POPULATION))
  FROM CITY CI, COUNTRY CO
 WHERE CI.COUNTRYCODE = CO.CODE
 GROUP BY CO.CONTINENT