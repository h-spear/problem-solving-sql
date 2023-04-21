-- https://leetcode.com/problems/ad-free-sessions/

SELECT DISTINCT session_id
  FROM Playback P
 WHERE (SELECT COUNT(*)
          FROM Ads 
         WHERE customer_id = P.customer_id AND
               timestamp BETWEEN P.start_time AND P.end_time) = 0;