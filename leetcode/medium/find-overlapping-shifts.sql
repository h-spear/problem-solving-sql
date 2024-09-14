select ES1.employee_id
     , count(ES1.employee_id) as 'overlapping_shifts'
  from EmployeeShifts ES1
  join EmployeeShifts ES2
    on ES1.employee_id = ES2.employee_id
 where ES1.start_time < ES2.start_time and ES2.start_time < ES1.end_time
 group by ES1.employee_id
 order by ES1.employee_id;