-- https://www.hackerrank.com/challenges/revising-the-select-query/problem

SELECT ID
     , NAME
     , COUNTRYCODE
     , DISTRICT
     , POPULATION
    
  FROM CITY
  
 WHERE POPULATION > 100000 AND
       COUNTRYCODE = 'USA'