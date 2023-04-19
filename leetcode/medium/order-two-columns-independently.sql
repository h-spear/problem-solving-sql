-- https://leetcode.com/problems/order-two-columns-independently/

SELECT first_col, second_col

  FROM(SELECT first_col, (@v1 := @v1 + 1) AS idx
         FROM Data, (SELECT @v1 := 0) V
        ORDER BY first_col) A

  JOIN(SELECT second_col, (@v2 := @v2 + 1) AS idx
         FROM Data, (SELECT @v2 := 0) V
     ORDER BY second_col DESC) B

    ON A.idx = B.idx;

-- ROW_NUMBER 사용
-- https://leetcode.com/problems/order-two-columns-independently/solutions/1745446/mysql-simple-solutionn/?orderBy=hot

SELECT first_col, second_col
FROM (
    SELECT first_col, ROW_NUMBER() OVER(ORDER BY first_col ASC) AS r
    FROM Data
) a
JOIN (
    SELECT second_col, ROW_NUMBER() OVER(ORDER BY second_col DESC) AS r
    FROM Data
) b
ON a.r = b.r