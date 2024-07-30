-- https://leetcode.com/problems/odd-and-even-transactions/

select transaction_date
     , ifnull(sum(case when amount & 1 = 1 then amount end), 0) as odd_sum
     , ifnull(sum(case when amount & 1 = 0 then amount end), 0) as even_sum
  from transactions
 group by transaction_date
 order by transaction_date;