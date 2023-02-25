-- https://www.hackerrank.com/challenges/interviews/problem

SELECT T.contest_id AS contest_id
     , T.hacker_id AS hacker_id
     , T.name AS name
     , SUM(S.total_submissions) AS total_submissions
     , SUM(S.total_accepted_submissions) AS total_accepted_submissions
     , SUM(V.total_views) AS total_views
     , SUM(V.total_unique_views) AS total_unique_views
    
  FROM Contests T
  JOIN Colleges C ON T.contest_id = C.contest_id
  JOIN Challenges H ON C.college_id = H.college_id
  
  LEFT JOIN (SELECT challenge_id
                  , SUM(total_views) as total_views
                  , SUM(total_unique_views) as total_unique_views
               FROM Views_Stats
              GROUP BY challenge_id) SUB1
         ON H.challenge_id = SUB1.challenge_id
         
  LEFT JOIN (SELECT challenge_id
                  , SUM(total_submissions) as total_submissions
                  , SUM(total_accepted_submissions) as total_accepted_submissions
               FROM Submission_Stats
              GROUP BY challenge_id) SUB2
         ON H.challenge_id = SUB2.challenge_id
         
 GROUP BY T.contest_id, T.hacker_id, T.name
 
HAVING SUM(S.total_submissions) > 0 OR 
       SUM(S.total_accepted_submissions) > 0 OR
       SUM(V.total_views) > 0 OR
       SUM(V.total_unique_views) > 0
       
 ORDER BY T.contest_id