-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/131116

SELECT FP.CATEGORY
     , FP.PRICE AS MAX_PRICE
     , FP.PRODUCT_NAME
     
  FROM FOOD_PRODUCT FP
  
 WHERE CATEGORY IN ('과자', '국', '김치', '식용유') AND
       PRICE = (SELECT MAX(PRICE)
                  FROM FOOD_PRODUCT
                 WHERE CATEGORY = FP.CATEGORY)
                
 ORDER BY MAX_PRICE DESC;