-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/131123

SELECT R.FOOD_TYPE AS FOOD_TYPE
     , R.REST_ID AS REST_ID
     , R.REST_NAME AS REST_NAME
     , R.FAVORITES AS FAVORITES
  FROM REST_INFO R
  JOIN (SELECT FOOD_TYPE, MAX(FAVORITES) AS FAVORITES
          FROM REST_INFO
         GROUP BY FOOD_TYPE) AS SUB
    ON R.FOOD_TYPE = SUB.FOOD_TYPE AND
       R.FAVORITES = SUB.FAVORITES
 ORDER BY R.FOOD_TYPE DESC;

