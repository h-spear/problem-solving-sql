-- https://leetcode.com/problems/suspicious-bank-accounts/

with cte as (
    select account_id
        , date_format(day, "%Y-%m") as ym
        , date_format(date_sub(day, interval 1 month), "%Y-%m") as prevym
        , sum(amount) as income
    from Transactions
    where type = 'Creditor'
    group by account_id, date_format(day, "%Y-%m")
)

select distinct A.account_id
  from Accounts A
  join (select T1.account_id, T1.income as income1, T2.income as income2
          from cte T1
          join cte T2
            on T1.account_id = T2.account_id and T1.ym = T2.prevym) Sub
    on A.account_id = Sub.account_id and Sub.income1 > A.max_income and Sub.income2 > A.max_income;