-- level1
-- https://school.programmers.co.kr/learn/courses/30/lessons/59405

SELECT NAME
  FROM ANIMAL_INS
 WHERE DATETIME = (SELECT MIN(DATETIME)
                     FROM ANIMAL_INS)