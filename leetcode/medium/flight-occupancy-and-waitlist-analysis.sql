-- https://leetcode.com/problems/flight-occupancy-and-waitlist-analysis/

select F.flight_id
     , if (count(P.passenger_id) > F.capacity, F.capacity, count(P.passenger_id)) as booked_cnt
     , if (count(P.passenger_id) > F.capacity, count(P.passenger_id) - F.capacity, 0) as waitlist_cnt
  from Flights F
  left join Passengers P
    on F.flight_id = P.flight_id
 group by flight_id
 order by flight_id;