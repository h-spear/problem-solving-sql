-- https://leetcode.com/problems/group-employees-of-the-same-salary/
-- Beats 96.01%

select E.employee_id
     , E.name
     , E.salary
     , dense_rank() over (order by salary) as team_id
  from Employees E
  where salary in (select salary
                     from Employees
                    group by salary
                   having count(employee_id) >= 2)
 order by team_id, employee_id;
