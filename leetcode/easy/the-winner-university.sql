-- https://leetcode.com/problems/the-winner-university/

SELECT CASE WHEN COUNT(CASE WHEN N.score >= 90 THEN 1 END) > COUNT(CASE WHEN C.score >= 90 THEN 1 END)
            THEN 'New York University'
            WHEN COUNT(CASE WHEN N.score >= 90 THEN 1 END) < COUNT(CASE WHEN C.score >= 90 THEN 1 END)
            THEN 'California University'
            ELSE 'No Winner' END Winner
  FROM NewYork N, California C;