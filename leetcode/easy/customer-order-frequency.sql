-- https://leetcode.com/problems/customer-order-frequency/

SELECT C.customer_id AS customer_id
     , C.name AS name
  FROM Orders O
  JOIN Customers C
    ON O.customer_id = C.customer_id
  JOIN Product P
    ON O.product_id = P.product_id
 WHERE YEAR(O.order_date) = 2020
 GROUP BY customer_id
HAVING SUM(CASE WHEN MONTH(O.order_date) = 6 THEN P.price * O.quantity END) >= 100 AND
       SUM(CASE WHEN MONTH(O.order_date) = 7 THEN P.price * O.quantity END) >= 100;