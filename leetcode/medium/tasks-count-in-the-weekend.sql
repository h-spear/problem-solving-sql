-- https://leetcode.com/problems/tasks-count-in-the-weekend/

select count(case when dayOfWeek(submit_date) = 1 or dayOfWeek(submit_date) = 7 then 1 end) as weekend_cnt,
       count(case when dayOfWeek(submit_date) > 1 and dayOfWeek(submit_date) < 7 then 1 end) as working_cnt
  from Tasks