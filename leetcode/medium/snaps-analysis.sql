-- https://leetcode.com/problems/snaps-analysis/

select age_bucket
     , ifnull(round(sum(case when activity_type = 'send' then time_spent end) * 100
                    / sum(time_spent), 2), 0) as `send_perc`
     , ifnull(round(sum(case when activity_type = 'open' then time_spent end) * 100
                    / sum(time_spent), 2), 0) as `open_perc`
  from Activities A
  join Age
    on A.user_id = Age.user_id
 group by age_bucket;