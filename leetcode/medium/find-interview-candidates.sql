-- https://leetcode.com/problems/find-interview-candidates/

with medalists as(
    select contest_id, gold_medal as user_id from contests
    union all 
    select contest_id, silver_medal as user_id from contests
    union all 
    select contest_id, bronze_medal as user_id from contests
), cte as (
    select distinct M1.user_id
    from medalists M1
    join medalists M2 
        on M1.contest_id + 1 = M2.contest_id and M1.user_id = M2.user_id
    join medalists M3
        on M2.contest_id + 1 = M3.contest_id and M2.user_id = M3.user_id

    union

    select gold_medal
    from Contests
    group by gold_medal
    having count(contest_id) >= 3
)

select U.name, U.mail
  from Users U
  join cte C
    on U.user_id = C.user_id;