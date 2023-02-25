-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/59044

SELECT OUTS.ANIMAL_ID
     , OUTS.NAME
      
  FROM ANIMAL_INS INS,
       ANIMAL_OUTS OUTS
       
 WHERE INS.ANIMAL_ID = OUTS.ANIMAL_ID
 
 ORDER BY DATEDIFF(OUTS.DATETIME, INS.DATETIME) DESC
 
 LIMIT 2