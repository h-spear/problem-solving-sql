-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/133027

SELECT FLAVOR

  FROM 
       (SELECT FLAVOR, TOTAL_ORDER
          FROM FIRST_HALF
     
         UNION

        SELECT FLAVOR, TOTAL_ORDER
          FROM JULY) SUB

 GROUP BY FLAVOR
 ORDER BY SUM(TOTAL_ORDER) DESC
 LIMIT 3;