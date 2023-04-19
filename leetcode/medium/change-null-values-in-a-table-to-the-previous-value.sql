-- https://leetcode.com/problems/change-null-values-in-a-table-to-the-previous-value/

SELECT id
     , IF (drink IS NULL, 
           @prev,
           @prev := drink) AS drink
  FROM CoffeeShop, (SELECT @prev := null) Variable;