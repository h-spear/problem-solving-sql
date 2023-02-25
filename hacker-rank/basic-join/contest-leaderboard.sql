-- https://www.hackerrank.com/challenges/contest-leaderboard/problem

SELECT hacker_id
     , name
     , SUM(score) AS score

  FROM (SELECT H.hacker_id
             , H.name
             , S.challenge_id
             , MAX(S.score) AS score
          FROM Hackers H JOIN Submissions S
            ON H.hacker_id = S.hacker_id
         WHERE S.score <> 0
         GROUP BY H.hacker_id, H.name, S.challenge_id) T
    
 GROUP BY hacker_id, name
 
 ORDER BY SUM(SCORE) DESC
        , hacker_id ASC