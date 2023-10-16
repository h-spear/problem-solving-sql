-- https://leetcode.com/problems/the-airport-with-the-most-traffic/

with traffics as (
select airport_id, ifnull(sum(case when departure_airport = Sub.airport_id then flights_count end), 0) + 
          ifnull(sum(case when arrival_airport = Sub.airport_id then flights_count end), 0) as traffic
  from Flights F
  join (select departure_airport as airport_id from Flights
         union
        select arrival_airport as airport_id from Flights) Sub
 group by airport_id
)

select airport_id
  from traffics
 where traffic = (select max(traffic) from traffics);