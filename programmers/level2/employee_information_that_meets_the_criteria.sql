-- level2
-- https://school.programmers.co.kr/learn/courses/30/lessons/284527

SELECT SUM(G.SCORE) AS `SCORE`
     , E.EMP_NO
     , E.EMP_NAME
     , E.POSITION
     , E.EMAIL
  FROM HR_DEPARTMENT D
  JOIN HR_EMPLOYEES E
    ON D.DEPT_ID = E.DEPT_ID
  JOIN HR_GRADE G
    ON E.EMP_NO = G.EMP_NO
 GROUP BY E.EMP_NO
 ORDER BY `SCORE` DESC
 LIMIT 1;
