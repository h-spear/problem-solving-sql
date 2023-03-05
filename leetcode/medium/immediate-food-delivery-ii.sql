-- https://leetcode.com/problems/immediate-food-delivery-ii/

SELECT ROUND(
        (COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END) * 100) / COUNT(*)
       , 2) AS immediate_percentage 
  FROM Delivery
  WHERE (customer_id, order_date) IN (SELECT customer_id
                                           , MIN(order_date) AS first_order_date
                                        FROM Delivery
                                       GROUP BY customer_id);
