-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/284529

SELECT D.DEPT_ID
     , DEPT_NAME_EN
     , ROUND(AVG(SAL), 0) AS AVG_SAL
  FROM HR_DEPARTMENT D
  JOIN HR_EMPLOYEES E
    ON D.DEPT_ID = E.DEPT_ID
 GROUP BY D.DEPT_ID
 ORDER BY AVG_SAL DESC;