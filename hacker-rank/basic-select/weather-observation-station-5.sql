-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem

(SELECT CITY
      , LENGTH(CITY)
   FROM STATION
  WHERE LENGTH(CITY) = (SELECT MIN(LENGTH(CITY))
                          FROM STATION)
  ORDER BY CITY ASC
  LIMIT 1)
        
  UNION 

(SELECT CITY
      , LENGTH(CITY)
   FROM STATION
  WHERE LENGTH(CITY) = (SELECT MAX(LENGTH(CITY))
                          FROM STATION)
  ORDER BY CITY ASC
  LIMIT 1)       