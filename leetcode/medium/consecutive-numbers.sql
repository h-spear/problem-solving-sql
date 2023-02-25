-- https://leetcode.com/problems/consecutive-numbers/

SELECT DISTINCT L1.num AS ConsecutiveNums

  FROM Logs L1 JOIN
       Logs L2 JOIN
       Logs L3
       
    ON L3.id = L1.id + 2 AND
       L2.id = L1.id + 1
       
 WHERE L1.num = L2.num AND
       L2.num = L3.num;