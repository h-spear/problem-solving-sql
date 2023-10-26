-- https://leetcode.com/problems/find-active-users/

with cte as (
    select user_id, created_at, row_number() over (order by created_at asc) as num
      from Users
)

select distinct T1.user_id
  from cte T1
  join cte T2
    on T1.user_id = T2.user_id and
       T1.num != T2.num and
       abs(datediff(T1.created_at, T2.created_at)) <= 7;