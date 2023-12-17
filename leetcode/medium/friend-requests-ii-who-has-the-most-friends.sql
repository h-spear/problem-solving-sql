-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/

SELECT id, COUNT(id) as num
  FROM (SELECT requester_id AS id
          FROM RequestAccepted
         UNION ALL
        SELECT accepter_id AS id
          FROM RequestAccepted) Sub
 GROUP BY id
 ORDER BY COUNT(id) DESC
 LIMIT 1;