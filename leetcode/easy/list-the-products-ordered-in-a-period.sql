-- https://leetcode.com/problems/list-the-products-ordered-in-a-period/

SELECT P.product_name
     , SUM(unit) AS unit
  FROM Products P
  JOIN Orders O
    ON P.product_id = O.product_id
 WHERE YEAR(O.order_date) = 2020 AND MONTH(O.order_date) = 2
 GROUP BY P.product_id
HAVING SUM(unit) >= 100;