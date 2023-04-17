-- https://leetcode.com/problems/fix-product-name-format/
-- Beats 96.18%

SELECT LOWER(TRIM(product_name)) AS product_name
     , DATE_FORMAT(sale_date, '%Y-%m') AS sale_date
     , COUNT(sale_id) AS total
  FROM Sales
 GROUP BY LOWER(TRIM(product_name)), YEAR(sale_date), MONTH(sale_date)
 ORDER BY product_name, sale_date;