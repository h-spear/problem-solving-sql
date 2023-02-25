-- level2
-- https://school.programmers.co.kr/learn/courses/30/lessons/131530

SELECT TRUNCATE(PRICE, -4) AS PRICE_GROUP
     , COUNT(*) AS PRODUCTS
  FROM PRODUCT
 GROUP BY PRICE_GROUP
 ORDER BY PRICE_GROUP;