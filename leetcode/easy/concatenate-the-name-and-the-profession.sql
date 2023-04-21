-- https://leetcode.com/problems/concatenate-the-name-and-the-profession/

SELECT person_id
     , CONCAT(name, '(', SUBSTRING(profession, 1, 1), ')') AS name
  FROM Person
 ORDER BY person_id DESC;