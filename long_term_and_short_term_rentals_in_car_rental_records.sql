-- level1
-- https://school.programmers.co.kr/learn/courses/30/lessons/151138

SELECT HISTORY_ID
     , CAR_ID
     , DATE_FORMAT(START_DATE, "%Y-%m-%d") AS START_DATE
     , DATE_FORMAT(END_DATE, "%Y-%m-%d") AS END_DATE
     , IF (DATEDIFF(END_DATE + 1, START_DATE) >= 30,
           '장기 대여', '단기 대여') AS RENT_TYPE
  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
 WHERE YEAR(START_DATE) = 2022 AND
       MONTH(START_DATE) = 9
 ORDER BY HISTORY_ID DESC;