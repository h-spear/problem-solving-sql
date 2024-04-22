-- https://leetcode.com/problems/find-peak-calling-hours-for-each-city/

with calling_hours as (
    select city
         , hour(call_time) as `calling_hour`
         , count(*) as `number_of_calls`
      from Calls
     group by hour(call_time), city
), max_number_of_calls as (
    select city, max(number_of_calls) as `number_of_calls`
      from calling_hours
     group by city
)

select ch.city
     , calling_hour as `peak_calling_hour`
     , ch.number_of_calls
  from calling_hours ch
  join max_number_of_calls mnoc
    on ch.city = mnoc.city
 where ch.number_of_calls = mnoc.number_of_calls
 order by `peak_calling_hour` desc, city desc;