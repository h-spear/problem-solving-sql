-- https://leetcode.com/problems/new-users-daily-count/

SELECT login_date
     , COUNT(user_id) AS user_count
  FROM (SELECT user_id, MIN(activity_date) AS login_date
          FROM Traffic
         WHERE activity = 'login'
         GROUP BY user_id) SUB
 WHERE DATEDIFF('2019-06-30', login_date) <= 90
 GROUP BY login_date;