-- https://leetcode.com/problems/product-sales-analysis-v/

SELECT S.user_id AS user_id
     , SUM(P.price * S.quantity) AS spending
  FROM Sales S
  JOIN Product P
    ON S.product_id = P.product_id
 GROUP BY S.user_id
 ORDER BY spending DESC;