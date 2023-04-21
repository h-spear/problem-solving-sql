-- https://leetcode.com/problems/products-with-three-or-more-orders-in-two-consecutive-years/

WITH ProductCountByYear AS(
  SELECT product_id
      , YEAR(purchase_date) AS year
      , COUNT(product_id) AS cnt
    FROM Orders
  GROUP BY product_id, YEAR(purchase_date)
)

SELECT DISTINCT P1.product_id
  FROM ProductCountByYear P1
  JOIN ProductCountByYear P2
    ON P1.product_id = P2.product_id AND
       P1.year = P2.year - 1
 WHERE P1.cnt >= 3 AND P2.cnt >= 3;