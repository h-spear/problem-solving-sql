-- https://leetcode.com/problems/fix-names-in-a-table/

SELECT user_id
     , CONCAT(UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2, LENGTH(name) - 1))) AS name
  FROM Users
 ORDER BY user_id;