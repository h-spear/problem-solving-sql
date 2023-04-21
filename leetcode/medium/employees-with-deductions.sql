-- https://leetcode.com/problems/employees-with-deductions/

SELECT E.employee_id
  FROM Employees E
  LEFT JOIN Logs L
    ON E.employee_id = L.employee_id
 GROUP BY employee_id
 HAVING IFNULL(SUM(CEIL((TIMESTAMPDIFF(SECOND, L.in_time, L.out_time) / 60))), 0) 
              < MAX(E.needed_hours) * 60;