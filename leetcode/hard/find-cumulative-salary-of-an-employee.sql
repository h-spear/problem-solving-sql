-- https://leetcode.com/problems/find-cumulative-salary-of-an-employee/

SELECT E1.id, E1.month, (IFNULL(E1.salary, 0) + IFNULL(E2.salary, 0) + IFNULL(E3.salary, 0)) AS salary
  FROM Employee E1
  LEFT JOIN Employee E2
    ON E1.id = E2.id AND E1.month = E2.month + 1
  LEFT JOIN Employee E3
    ON E2.id = E3.id AND E2.month = E3.month + 1
 WHERE (E1.id, E1.month) NOT IN (SELECT id, MAX(month) FROM Employee WHERE id = E1.id)
 ORDER BY E1.id, E1.month DESC;

-- https://leetcode.com/problems/find-cumulative-salary-of-an-employee/solutions/2349661/simple-and-efficient-83/?orderBy=hot
SELECT id, month, sum(salary) OVER (PARTITION BY id ORDER BY month RANGE BETWEEN 2 PRECEDING and CURRENT ROW) as Salary
  FROM Employee E
 WHERE (E.id, E.month) NOT IN (SELECT id, MAX(month) FROM Employee WHERE id = E.id)
 ORDER BY id, month DESC;