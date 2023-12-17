-- https://leetcode.com/problems/count-salary-categories/

WITH Category AS (
    SELECT 'Low Salary' AS category
     UNION 
    SELECT 'Average Salary' AS category
     UNION 
    SELECT 'High Salary' AS category
)

SELECT C.category
     , COUNT(Sub.category) AS accounts_count
  FROM Category C 
  LEFT JOIN (SELECT (CASE WHEN income < 20000 THEN 'Low Salary'
                          WHEN income <= 50000 THEN 'Average Salary'
                          ELSE 'High Salary' END) as category
               FROM Accounts) Sub
    ON C.category = Sub.category
 GROUP BY category;