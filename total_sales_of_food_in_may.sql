-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/131117

SELECT P.PRODUCT_ID AS PRODUCT_ID
     , P.PRODUCT_NAME AS PRODUCT_NAME
     , SUM(P.PRICE * O.AMOUNT) AS TOTAL_SALES
     
  FROM FOOD_PRODUCT P
  JOIN FOOD_ORDER O
    ON P.PRODUCT_ID = O.PRODUCT_ID
    
 WHERE YEAR(O.PRODUCE_DATE) = 2022 AND
       MONTH(O.PRODUCE_DATE) = 5
       
 GROUP BY PRODUCT_ID, PRODUCT_NAME
    
 ORDER BY TOTAL_SALES DESC, PRODUCT_ID;