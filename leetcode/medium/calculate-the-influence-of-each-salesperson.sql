-- https://leetcode.com/problems/calculate-the-influence-of-each-salesperson/

SELECT SP.salesperson_id AS salesperson_id
     , SP.name AS name
     , IFNULL(SUM(price), 0) AS total
  FROM Salesperson SP
  LEFT JOIN Customer C
    ON SP.salesperson_id = C.salesperson_id
  LEFT JOIN Sales S
    ON C.customer_id = S.customer_id
 GROUP BY SP.salesperson_id;