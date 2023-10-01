-- https://leetcode.com/problems/calculate-salaries/
-- Beats 96.59%

select S.company_id, S.employee_id, S.employee_name
     , (case when max_salary < 1000 then salary
             when max_salary <= 10000 then round(salary * 0.76, 0)
             else round(salary * 0.51, 0) end) as salary
  from Salaries S
  join (select company_id, max(salary) as max_salary from salaries group by company_id) as Sub
    on S.company_id = Sub.company_id