-- https://www.hackerrank.com/challenges/african-cities/problem

SELECT CI.NAME
  FROM CITY CI, COUNTRY CO
 WHERE CI.COUNTRYCODE = CO.CODE AND 
       CO.CONTINENT = 'Africa'