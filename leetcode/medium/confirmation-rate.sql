-- https://leetcode.com/problems/confirmation-rate/

SELECT S.user_id AS user_id
     , ROUND(IFNULL(COUNT(CASE WHEN action = 'confirmed' THEN 1 END)
             / COUNT(C.user_id), 0), 2) AS confirmation_rate
  FROM Signups S
  LEFT JOIN Confirmations C
    ON S.user_id = C.user_id
 GROUP BY S.user_id;