-- https://leetcode.com/problems/number-of-accounts-that-did-not-stream/

select count(S.account_id) as accounts_count
  from Subscriptions S
  join Streams ST
    on S.account_id = ST.account_id
 where (year(start_date) = 2021 or year(end_date) = 2021) and
       year(stream_date) != 2021;