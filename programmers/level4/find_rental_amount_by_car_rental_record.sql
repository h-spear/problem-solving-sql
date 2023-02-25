-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/151141

SELECT HISTORY_ID
     , TRUNCATE(DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) * DAILY_FEE *
       CASE
        WHEN DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) < 7
             THEN 1
        WHEN DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) < 30
             THEN (SELECT (100 - DISCOUNT_RATE) * 0.01
                     FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                    WHERE CAR_TYPE = '트럭' AND
                          DURATION_TYPE = '7일 이상')
        WHEN DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) < 80
             THEN (SELECT (100 - DISCOUNT_RATE) * 0.01
                     FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                    WHERE CAR_TYPE = '트럭' AND
                          DURATION_TYPE = '30일 이상')
        ELSE (SELECT (100 - DISCOUNT_RATE) * 0.01
                     FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                    WHERE CAR_TYPE = '트럭' AND
                          DURATION_TYPE = '90일 이상') END, 0) AS FEE
  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
  JOIN CAR_RENTAL_COMPANY_CAR C
    ON H.CAR_ID = C.CAR_ID 
 WHERE C.CAR_TYPE = '트럭'
 ORDER BY FEE DESC, HISTORY_ID DESC;
       