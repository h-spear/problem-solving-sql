-- https://www.hackerrank.com/challenges/occupations/problem

SET @doc = -1;
SET @act = -1;
SET @sin = -1;
SET @pro = -1;
SET @idx = -1;

SELECT D.Name, P.Name, S.Name, A.Name
  FROM (SELECT @idx := @idx + 1 AS ROW_NUM
          FROM OCCUPATIONS
         WHERE @idx < (SELECT MAX(CNT)
                         FROM (SELECT COUNT(*) AS CNT
                                 FROM OCCUPATIONS
                                GROUP BY Occupation) SUB) - 1) C

     LEFT JOIN 

       (SELECT @doc := @doc+1 AS ROW_NUM, Name
          FROM OCCUPATIONS
         WHERE Occupation = 'Doctor'
         ORDER BY Name) D
            ON C.ROW_NUM = D.ROW_NUM

     LEFT JOIN 

       (SELECT @pro := @pro+1 AS ROW_NUM, Name
          FROM OCCUPATIONS
         WHERE Occupation = 'Professor'
         ORDER BY Name) P
            ON C.ROW_NUM = P.ROW_NUM

     LEFT JOIN
     
       (SELECT @sin := @sin+1 AS ROW_NUM, Name
          FROM OCCUPATIONS
         WHERE Occupation = 'Singer'
         ORDER BY Name) S
            ON C.ROW_NUM = S.ROW_NUM

    LEFT JOIN

       (SELECT @act := @act+1 AS ROW_NUM, Name
          FROM OCCUPATIONS
         WHERE Occupation = 'Actor'
         ORDER BY Name) A
            ON C.ROW_NUM = A.ROW_NUM

