-- https://www.hackerrank.com/challenges/challenges/problem


SELECT H.hacker_id AS hacker_id
     , H.name AS name 
     , COUNT(*) AS challenges_created

  FROM Hackers H JOIN
       Challenges C

    ON H.hacker_id = C.hacker_id

 GROUP BY H.hacker_id, H.name

HAVING challenges_created IN (SELECT challenges_created
                                FROM (SELECT hacker_id, COUNT(*) AS challenges_created
                                        FROM Challenges
                                       GROUP BY hacker_id) SUB
                               GROUP BY challenges_created
                              HAVING COUNT(*) = 1)

                                OR
                                
       challenges_created = (SELECT MAX(challenges_created)
                               FROM (SELECT COUNT(*) AS challenges_created
                                       FROM Challenges
                                      GROUP BY hacker_id) SUB)
                                     
 ORDER BY challenges_created DESC
        , hacker_id ASC                                