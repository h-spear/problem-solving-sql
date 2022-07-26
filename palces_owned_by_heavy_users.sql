-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/77487

SELECT ID
     , NAME
     , HOST_ID
     
  FROM PLACES
  
 WHERE HOST_ID IN (SELECT HOST_ID
                     FROM PLACES
                    GROUP BY HOST_ID
                   HAVING COUNT(HOST_ID) >= 2)
                   
 ORDER BY ID