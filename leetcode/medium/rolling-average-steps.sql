-- https://leetcode.com/problems/rolling-average-steps/

select s3.user_id
     , s3.steps_date
     , round((s1.steps_count + s2.steps_count + s3.steps_count) / 3, 2) as rolling_average
  from Steps s1
  join Steps s2
    on s1.user_id = s2.user_id and s1.steps_date = date_add(s2.steps_date, interval -1 day)
  join Steps s3
    on s1.user_id = s3.user_id and s1.steps_date = date_add(s3.steps_date, interval -2 day)
 order by user_id, s3.steps_date;