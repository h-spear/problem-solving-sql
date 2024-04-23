-- https://leetcode.com/problems/find-third-transaction/
-- https://leetcode.com/problems/find-third-transaction/solutions/5060838/mysql-beats-99-69/
-- Beats 99.69%

with cte as (
    select user_id
         , transaction_date
         , spend
         , rank() over (partition by user_id order by transaction_date) as `rank`
      from Transactions
)

select t1.user_id as user_id
     , t3.spend as third_transaction_spend
     , t3.transaction_date as third_transaction_date
  from cte t1 
  join cte t2
    on t1.user_id = t2.user_id and
       t1.rank = 1 and t2.rank = 2
  join cte t3
    on t2.user_id = t3.user_id and
       t2.rank = 2 and t3.rank = 3
 where t1.spend < t3.spend and
       t2.spend < t3.spend
 order by t1.user_id;