-- https://leetcode.com/problems/unpopular-books/

WITH Temp AS(
SELECT book_id, SUM(CASE WHEN dispatch_date > '2018-06-23' THEN quantity ELSE 0 END) AS summation
  FROM Orders
 GROUP BY book_id
)

SELECT B.book_id, B.name
  FROM Books B 
  LEFT JOIN Temp T
    ON B.book_id = T.book_id
 WHERE B.available_from < '2019-05-23' AND
       (T.summation < 10 OR T.summation IS NULL);