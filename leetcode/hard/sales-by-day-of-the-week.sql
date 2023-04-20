-- https://leetcode.com/problems/sales-by-day-of-the-week/

SELECT I.item_category AS CATEGORY
     , SUM(CASE WHEN DAYOFWEEK(O.order_date) = 2 THEN O.quantity ELSE 0 END) AS MONDAY
     , SUM(CASE WHEN DAYOFWEEK(O.order_date) = 3 THEN O.quantity ELSE 0 END) AS TUESDAY
     , SUM(CASE WHEN DAYOFWEEK(O.order_date) = 4 THEN O.quantity ELSE 0 END) AS WEDNESDAY
     , SUM(CASE WHEN DAYOFWEEK(O.order_date) = 5 THEN O.quantity ELSE 0 END) AS THURSDAY
     , SUM(CASE WHEN DAYOFWEEK(O.order_date) = 6 THEN O.quantity ELSE 0 END) AS FRIDAY
     , SUM(CASE WHEN DAYOFWEEK(O.order_date) = 7 THEN O.quantity ELSE 0 END) AS SATURDAY
     , SUM(CASE WHEN DAYOFWEEK(O.order_date) = 1 THEN O.quantity ELSE 0 END) AS SUNDAY
  FROM Items I
  LEFT JOIN Orders O
    ON I.item_id = O.item_id
 GROUP BY I.item_category
 ORDER BY I.item_category;