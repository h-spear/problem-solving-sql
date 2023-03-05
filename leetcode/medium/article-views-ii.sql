-- https://leetcode.com/problems/article-views-ii/

SELECT DISTINCT viewer_id AS id
  FROM Views
 GROUP BY viewer_id, view_date
HAVING COUNT(DISTINCT article_id) >= 2
 ORDER BY id;