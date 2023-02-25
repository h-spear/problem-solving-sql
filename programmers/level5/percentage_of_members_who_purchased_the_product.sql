-- level5
-- https://school.programmers.co.kr/learn/courses/30/lessons/131534

SELECT YEAR(O.SALES_DATE) AS YEAR
     , MONTH(O.SALES_DATE) AS MONTH
     , COUNT(DISTINCT O.USER_ID) AS PUCHASED_USERS
     , ROUND(
             COUNT(DISTINCT O.USER_ID) /
                     (SELECT COUNT(USER_ID)
                        FROM USER_INFO
                       WHERE YEAR(JOINED) = 2021)
         , 1) AS PUCHASED_RATIO
         
  FROM ONLINE_SALE O
  
  JOIN (SELECT DISTINCT USER_ID
          FROM USER_INFO
         WHERE YEAR(JOINED) = 2021) SUB
         
    ON O.USER_ID = SUB.USER_ID
    
 GROUP BY YEAR(O.SALES_DATE), MONTH(O.SALES_DATE)
 
 ORDER BY YEAR(O.SALES_DATE), MONTH(O.SALES_DATE);