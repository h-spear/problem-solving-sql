-- https://leetcode.com/problems/users-with-two-purchases-within-seven-days/

with cte as (
    select user_id, purchase_date, row_number() over (order by purchase_date asc) as num
      from Purchases
)

select distinct T1.user_id
  from cte T1
  join cte T2
    on T1.user_id = T2.user_id and
       T1.num != T2.num and
       abs(datediff(T1.purchase_date, T2.purchase_date)) <= 7
 order by T1.user_id;