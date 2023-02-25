-- https://www.hackerrank.com/challenges/symmetric-pairs/problem

(
    (SELECT F1.X, F1.Y
       FROM Functions F1 JOIN Functions F2
         ON F1.X = F2.Y AND F2.X = F1.Y
      WHERE F1.X < F1.Y
      GROUP BY F1.X, F1.Y
      ORDER BY F1.X, F1.Y)
    
      UNION
    
    (SELECT X, Y
       FROM Functions
      WHERE X = Y
      GROUP BY X, Y
     HAVING COUNT(*) > 1)
) 
ORDER BY X, Y