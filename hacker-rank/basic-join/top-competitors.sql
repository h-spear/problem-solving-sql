-- https://www.hackerrank.com/challenges/full-score/problem

SELECT H.hacker_id AS hacker_id
     , H.name AS name
     
  FROM Submissions S JOIN
           Hackers H JOIN
        Challenges C JOIN
        Difficulty D
        
    ON S.hacker_id = H.hacker_id AND
       S.challenge_id = C.challenge_id AND
       C.difficulty_level = D.difficulty_level AND
       S.score = D.score
      
 GROUP BY H.hacker_id, H.name
 
HAVING COUNT(H.hacker_id) > 1

 ORDER BY COUNT(H.hacker_id) DESC
        , H.hacker_id ASC