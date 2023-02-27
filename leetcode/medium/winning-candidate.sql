-- https://leetcode.com/problems/winning-candidate/

SELECT C.name AS name
  FROM Vote V
  JOIN Candidate C
    ON C.id = V.candidateId
 GROUP BY candidateId
 ORDER BY count(C.id) DESC
 LIMIT 1;