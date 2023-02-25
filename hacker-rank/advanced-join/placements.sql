-- https://www.hackerrank.com/challenges/placements/problem

SELECT S.Name

  FROM Students S JOIN
       Friends F JOIN
       Packages P1 JOIN
       Packages P2

    ON S.ID = F.ID AND
       S.ID = P1.ID AND
       F.Friend_ID = P2.ID

 WHERE P1.Salary < P2.Salary
 
 ORDER BY P2.Salary