-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

SELECT W.ID AS id
     , P.age AS age
     , W.coins_needed AS coins_needed
     , W.power AS power
     
  FROM Wands W JOIN
       Wands_Property P
       
    ON W.code = P.code

 WHERE P.is_evil = 0 AND
       W.coins_needed = (SELECT MIN(coins_needed)
                           FROM Wands W2 JOIN
                                Wands_Property P2
                             ON W2.code = P2.code
                          WHERE P2.is_evil = 0 AND
                                W2.power = W.power AND
                                P2.age = P.age)
                                
 ORDER BY W.power DESC
        , P.age DESC