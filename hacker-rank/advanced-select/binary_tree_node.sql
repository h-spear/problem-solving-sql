-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem

SELECT N
     , (CASE WHEN P IS NULL THEN 'Root'
             WHEN N IN (SELECT P
                          FROM BST
                         GROUP BY P) THEN 'Inner'
             ELSE 'Leaf' END) AS NODE
             
  FROM BST
  
 ORDER BY N
