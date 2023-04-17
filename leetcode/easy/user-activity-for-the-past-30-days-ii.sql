-- https://leetcode.com/problems/user-activity-for-the-past-30-days-ii/

SELECT IFNULL(ROUND(COUNT(user_id) / COUNT(DISTINCT user_id), 2), 0) AS average_sessions_per_user
  FROM (SELECT user_id, session_id, activity_date, activity_type
          FROM Activity
         WHERE activity_date > DATE_ADD('2019-07-27', INTERVAL -30 DAY)
         GROUP BY user_id, session_id) SUB;