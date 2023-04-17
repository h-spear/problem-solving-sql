-- https://leetcode.com/problems/number-of-comments-per-post/

SELECT DISTINCT S.sub_id AS post_id
     , (SELECT COUNT(DISTINCT sub_id)
          FROM Submissions
         WHERE parent_id = S.sub_id) AS number_of_comments
  FROM Submissions S
 WHERE parent_id IS NULL
 ORDER BY post_id;