-- https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
-- very hard

SELECT S.submission_date AS submission_date
     , SUB1.hacker_count AS hacker_count
     , SUB2.hacker_id AS hacker_id
     , SUB2.name AS name
  FROM
  
  Submissions S
  
  JOIN
  
       (SELECT submission_date
             , COUNT(DISTINCT hacker_id) AS hacker_count
          FROM Submissions SSUB1
         WHERE submission_date - DATE('2016-03-01') = 
                            (SELECT COUNT(DISTINCT submission_date) 
                               FROM Submissions SSUB2
                              WHERE SSUB2.submission_date < SSUB1.submission_date AND
                                    SSUB2.hacker_id = SSUB1.hacker_id)
         GROUP BY submission_date) SUB1
      
    ON S.submission_date = SUB1.submission_date
         
  JOIN 
  
       (SELECT S.submission_date AS submission_date
             , H.hacker_id AS hacker_id
             , H.name AS name
          FROM Submissions S JOIN Hackers H
            ON S.hacker_id = H.hacker_id
         WHERE S.hacker_id = (SELECT hacker_id
                                FROM Submissions
                               WHERE submission_date = S.submission_date
                               GROUP BY hacker_id
                               ORDER BY COUNT(*) DESC, hacker_id
                               LIMIT 1)
         GROUP BY S.submission_date, S.hacker_id, H.name) SUB2
         
    ON SUB1.submission_date = SUB2.submission_date

 GROUP BY S.submission_date
        , SUB1.hacker_count 
        , SUB2.hacker_id
        , SUB2.name
        
 ORDER BY S.submission_date
 