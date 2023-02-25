-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/59045

SELECT INS.ANIMAL_ID
     , INS.ANIMAL_TYPE
     , INS.NAME

  FROM ANIMAL_INS INS
     , ANIMAL_OUTS OUTS

 WHERE INS.ANIMAL_ID = OUTS.ANIMAL_ID AND 
       INS.SEX_UPON_INTAKE LIKE '%Intact%' AND
       (OUTS.SEX_UPON_OUTCOME LIKE '%Spayed%' OR 
        OUTS.SEX_UPON_OUTCOME LIKE '%Neutered%')

 ORDER BY INS.ANIMAL_ID