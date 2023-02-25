-- https://www.hackerrank.com/challenges/the-report/problem

SELECT IF(GRADE < 8, NULL, S.Name) AS NAME
     , G.Grade AS GRADE
     , S.Marks AS MARKS
     
  FROM Students S
     , Grades G
     
 WHERE S.Marks >= G.Min_Mark AND
       S.Marks <= G.Max_Mark
       
 ORDER BY G.Grade DESC
        , S.Name ASC