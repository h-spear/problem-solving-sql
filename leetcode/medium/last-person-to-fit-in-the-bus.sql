-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/

SELECT person_name
  FROM (SELECT person_name, @val := @val + weight AS wgh
          FROM Queue, (SELECT @val := 0) AS Variable
         ORDER BY Turn) Sub
 WHERE wgh <= 1000
 ORDER BY wgh DESC
 LIMIT 1;