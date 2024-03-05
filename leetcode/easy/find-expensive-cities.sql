-- https://leetcode.com/problems/find-expensive-cities/
-- https://leetcode.com/problems/find-expensive-cities/solutions/4824274/mysql-simple-solution-beats-98-64/
-- Beats 98.64%

SELECT city
  FROM (SELECT city, AVG(price) as avg_price
          FROM Listings
         GROUP BY city) Sub
 WHERE avg_price > (SELECT AVG(price) FROM Listings)
 ORDER BY city;