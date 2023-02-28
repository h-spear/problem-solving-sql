-- https://leetcode.com/problems/product-sales-analysis-iii/

SELECT S.product_id, first_year, quantity, price
  FROM (SELECT product_id, MIN(year) AS first_year
          FROM Sales
         GROUP BY product_id) SUB
  JOIN Sales S
    ON S.product_id = SUB.product_id AND
       S.year = SUB.first_year;