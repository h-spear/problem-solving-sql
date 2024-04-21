-- https://leetcode.com/problems/friday-purchase-iii/

with WeekOfNovember2023 as (
    select 1 as `week_of_month`
         , '2023-11-03' as `friday_date`
     union 
    select 2 as `week_of_month`
         , '2023-11-10' as `friday_date`
     union 
    select 3 as `week_of_month`
         , '2023-11-17' as `friday_date`
     union 
    select 4 as `week_of_month`
         , '2023-11-24' as `friday_date`
), Memberships as (
    select 'Standard' as `membership`
     union
    select 'Premium' as `membership`
     union
    select 'VIP' as `membership`
), BaseTable as (
    select *
      from WeekOfNovember2023, Memberships
     where membership = 'VIP' or membership = 'Premium'
)

select B.week_of_month
     , B.membership
     , sum(ifnull(amount_spend, 0)) as `total_amount`
  from BaseTable B
  left join (select U.user_id, membership, purchase_date, amount_spend
               from Purchases P
               join Users U
                 on P.user_id = U.user_id) Sub
    on B.friday_date = sub.purchase_date and B.membership = Sub.membership
 group by B.week_of_month, B.membership
 order by B.week_of_month, B.membership;