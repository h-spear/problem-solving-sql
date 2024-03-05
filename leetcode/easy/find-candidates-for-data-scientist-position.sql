-- https://leetcode.com/problems/find-candidates-for-data-scientist-position/

SELECT candidate_id
  FROM Candidates
 WHERE skill in ('Python', 'Tableau', 'PostgreSQL')
 GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
 ORDER BY candidate_id;