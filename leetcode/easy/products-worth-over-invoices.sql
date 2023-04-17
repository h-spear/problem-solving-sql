-- https://leetcode.com/problems/products-worth-over-invoices/

SELECT P.name AS name
     , IFNULL(SUM(rest), 0) AS rest
     , IFNULL(SUM(paid), 0) AS paid
     , IFNULL(SUM(canceled), 0) AS canceled
     , IFNULL(SUM(refunded), 0) AS refunded
  FROM Product P
  LEFT JOIN Invoice I
    ON P.product_id = I.product_id
 GROUP BY P.product_id
 ORDER BY name;