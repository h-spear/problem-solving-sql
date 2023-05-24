-- https://leetcode.com/problems/average-time-of-process-per-machine/

SELECT A1.machine_id
     , ROUND(AVG(A1.timestamp - A2.timestamp), 3) AS processing_time
  FROM Activity A1
  JOIN Activity A2
    ON A1.machine_id = A2.machine_id AND
       A1.process_id = A2.process_id AND
       A1.activity_type = 'end' AND
       A2.activity_type = 'start'
 GROUP BY machine_id;