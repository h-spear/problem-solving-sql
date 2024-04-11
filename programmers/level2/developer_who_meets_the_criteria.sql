-- level2
-- https://school.programmers.co.kr/learn/courses/30/lessons/276034

SELECT D.ID AS `ID`
     , D.EMAIL AS `EMAIL`
     , D.FIRST_NAME AS `FIRST_NAME`
     , D.LAST_NAME AS `LAST_NAME`
  FROM DEVELOPERS D
  JOIN SKILLCODES S
    ON ((D.SKILL_CODE & S.CODE) > 0)
 WHERE S.NAME = 'Python' OR S.NAME = 'C#'
 GROUP BY `ID`, `EMAIL`, `FIRST_NAME`, `LAST_NAME`
 ORDER BY `ID`
