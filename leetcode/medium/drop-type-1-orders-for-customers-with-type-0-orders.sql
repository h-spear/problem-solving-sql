-- https://leetcode.com/problems/drop-type-1-orders-for-customers-with-type-0-orders/

SELECT order_id
     , O.customer_id
     , order_type
  FROM Orders O
  JOIN (SELECT customer_id
            , IF (COUNT(order_type) = COUNT(CASE WHEN order_type = 1 THEN 1 END), 'true', 'false') AS bool
        FROM Orders
        GROUP BY customer_id) SUB
    ON O.customer_id = SUB.customer_id
 WHERE bool = 'true' OR
       (bool = 'false' AND O.order_type = 0);
