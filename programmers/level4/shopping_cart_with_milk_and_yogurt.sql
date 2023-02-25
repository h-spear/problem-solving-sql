-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/62284

-- 나의 풀이
SELECT DISTINC용 CART_ID
  FROM CART_PRODUCTS A
 WHERE NAME IN ('Milk', 'Yogurt') AND 
       'Milk' IN (SELECT NAME
                    FROM CART_PRODUCTS B
                   WHERE A.CART_ID = B.CART_ID) AND
       'Yogurt' IN (SELECT NAME
                    FROM CART_PRODUCTS B
                   WHERE A.CART_ID = B.CART_ID)

-- 교집합 사용
SELECT A.CART_ID
  FROM (SELECT DISTINCT CART_ID
          FROM CART_PRODUCTS
         WHERE NAME = 'Milk') AS A, 
       (SELECT DISTINCT CART_ID
          FROM CART_PRODUCTS
         WHERE NAME = 'Yogurt') AS B
 WHERE A.CART_ID = B.CART_ID
         