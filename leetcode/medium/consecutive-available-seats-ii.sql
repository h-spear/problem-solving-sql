-- https://leetcode.com/problems/consecutive-available-seats-ii/

with free_seats as (
    select seat_id
         , seat_id - rank() over (order by seat_id) as 'group_id'
    from Cinema
    where free = 1
), cte as (
    select min(seat_id) as 'first_seat_id'
         , max(seat_id) as 'last_seat_id'
         , count(seat_id) as 'consecutive_seats_len'
    from free_seats
    group by group_id
)

select *
  from cte
 where consecutive_seats_len = (select max(consecutive_seats_len)
                                  from cte)
 order by first_seat_id;