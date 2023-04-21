-- https://leetcode.com/problems/users-that-actively-request-confirmation-messages/

SELECT DISTINCT S.user_id
  FROM Signups S
  LEFT JOIN Confirmations C1
    ON S.user_id = C1.user_id
  LEFT JOIN Confirmations C2
    ON S.user_id = C2.user_id
 WHERE C1.time_stamp < C2.time_stamp AND 
       TIMESTAMPDIFF(second, C1.time_stamp, C2.time_stamp) <= 86400;