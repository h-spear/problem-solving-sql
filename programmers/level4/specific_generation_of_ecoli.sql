-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/301650

-- solution1
SELECT ID
  FROM ECOLI_DATA
 WHERE PARENT_ID IN (SELECT ID
                       FROM ECOLI_DATA
                      WHERE PARENT_ID IN (SELECT ID
                                            FROM ECOLI_DATA
                                           WHERE PARENT_ID IS NULL))
 ORDER BY ID;

-- solution2
SELECT A.ID
  FROM ECOLI_DATA A
  JOIN ECOLI_DATA B
    ON A.PARENT_ID = B.ID
  JOIN ECOLI_DATA C
    ON B.PARENT_ID = C.ID
 WHERE C.PARENT_ID IS NULL
 ORDER BY A.ID;
 