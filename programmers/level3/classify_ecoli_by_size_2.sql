-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/301649

SELECT ID
     , (CASE WHEN PERCENTAGE <= 0.25 THEN 'CRITICAL'
             WHEN PERCENTAGE <= 0.5 THEN 'HIGH'
             WHEN PERCENTAGE <= 0.75 THEN 'MEDIUM'
             ELSE 'LOW' END) AS 'COLONY_NAME'
  FROM (SELECT ID
             , ROW_NUMBER() OVER (ORDER BY SIZE_OF_COLONY DESC) / 
                (SELECT COUNT(ID) FROM ECOLI_DATA) AS 'PERCENTAGE'
          FROM ECOLI_DATA) SUB
 ORDER BY ID;
