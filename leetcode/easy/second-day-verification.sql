-- https://leetcode.com/problems/second-day-verification/

select e.user_id
  from emails e
  join texts t
    on e.email_id = t.email_id
 where t.signup_action = 'Verified' and
       datediff(t.action_date, e.signup_date) = 1
 order by e.user_id;