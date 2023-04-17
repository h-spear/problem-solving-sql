-- https://leetcode.com/problems/friendly-movies-streamed-last-month/

SELECT DISTINCT C.title AS title
  FROM TVProgram T
  JOIN Content C
    ON T.content_id = C.content_id
 WHERE YEAR(T.program_date) = 2020 AND
       MONTH(T.program_date) = 6 AND
       C.Kids_content = 'Y' AND
       C.content_type = 'Movies';