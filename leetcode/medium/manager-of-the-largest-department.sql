-- https://leetcode.com/problems/manager-of-the-largest-department/

with EmployeeCount as (
    select dep_id, count(emp_id) as `count`
      from Employees
     group by dep_id
)

select emp_name as `manager_name`
     , E.dep_id as `dep_id`
  from EmployeeCount EC
  join Employees E
    on EC.dep_id = E.dep_id AND position = 'Manager'
 where EC.`count` = (select max(`count`) from EmployeeCount)
 order by dep_id;