-- https://www.hackerrank.com/challenges/japanese-cities-attributes/problem

SELECT ID
     , NAME
     , COUNTRYCODE
     , DISTRICT
     , POPULATION
    
  FROM CITY
  
 WHERE COUNTRYCODE = 'JPN'