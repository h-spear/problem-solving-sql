-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/299305

SELECT E.ID
     , IFNULL(CHILD_COUNT, 0) AS 'CHILD_COUNT'
  FROM ECOLI_DATA E
  LEFT JOIN (SELECT PARENT_ID AS ID, COUNT(PARENT_ID) AS 'CHILD_COUNT'
              FROM ECOLI_DATA
             GROUP BY PARENT_ID) SUB
    ON E.ID = SUB.ID
 ORDER BY E.ID;
 