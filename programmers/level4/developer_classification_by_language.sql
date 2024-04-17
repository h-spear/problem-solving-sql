-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/276036

SELECT CASE WHEN (COUNT(CASE WHEN S.CATEGORY = 'Front End' THEN 1 END) > 0 AND 
                  COUNT(CASE WHEN S.NAME = 'Python' THEN 1 END) > 0) 
            THEN 'A'
            WHEN (COUNT(CASE WHEN S.NAME = 'C#' THEN 1 END) > 0)
            THEN 'B'
            WHEN (COUNT(CASE WHEN S.CATEGORY = 'Front End' THEN 1 END) > 0)
            THEN 'C'
        END AS `GRADE`
     , D.ID
     , D.EMAIL
  FROM DEVELOPERS D
  JOIN SKILLCODES S
    ON (D.SKILL_CODE & S.CODE) > 0
 GROUP BY D.ID, D.EMAIL
HAVING `GRADE` IS NOT NULL
 ORDER BY `GRADE`, D.ID;