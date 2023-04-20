-- https://leetcode.com/problems/average-salary-departments-vs-company/

SELECT DATE_FORMAT(S.pay_date, '%Y-%m') AS pay_month
     , E.department_id AS department_id
     , (CASE WHEN ROUND(AVG(S.amount), 6) > avg_amount THEN 'higher'
             WHEN ROUND(AVG(S.amount), 6) < avg_amount THEN 'lower'
             ELSE 'same' END) AS comparison
     
  FROM Salary S

  JOIN Employee E
    ON S.employee_id = E.employee_id

  JOIN (SELECT DATE_FORMAT(pay_date, '%Y-%m') AS pay_month
             , ROUND(AVG(amount), 6) AS avg_amount
          FROM Salary 
         GROUP BY DATE_FORMAT(pay_date, '%Y-%m')) SUB
    ON DATE_FORMAT(S.pay_date, '%Y-%m') = SUB.pay_month

 GROUP BY pay_month, department_id;