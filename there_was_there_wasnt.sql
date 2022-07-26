-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/59043

SELECT INS.ANIMAL_ID
     , INS.NAME

  FROM ANIMAL_INS INS
     , ANIMAL_OUTS OUTS

 WHERE INS.ANIMAL_ID = OUTS.ANIMAL_ID AND
       INS.DATETIME > OUTS.DATETIME
       
 ORDER BY INS.DATETIME 