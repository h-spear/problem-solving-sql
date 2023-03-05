-- https://leetcode.com/problems/reported-posts-ii/

SELECT ROUND(AVG(IFNULL(removal_count, 0) / all_spam_count) * 100, 2) AS average_daily_percent
  FROM (SELECT action_date, COUNT(DISTINCT post_id) AS all_spam_count
          FROM Actions 
         WHERE extra = 'spam'
         GROUP BY action_date) SUB1
  LEFT JOIN (SELECT action_date, COUNT(DISTINCT A.post_id) AS removal_count
               FROM Actions A 
               JOIN Removals R
                 ON A.post_id = R.post_id
              WHERE extra = 'spam' AND
                    A.action_date <= R.remove_date
              GROUP BY action_date) SUB2
    ON SUB1.action_date = SUB2.action_date;
