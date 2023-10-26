-- https://leetcode.com/problems/the-number-of-passengers-in-each-bus-i/

select bus_id
     , count(passenger_id) as passengers_cnt
  from Buses B
  left join (select P.passenger_id, min(B.arrival_time) as bus_time
               from Buses B
               join Passengers P
                 on P.arrival_time <= B.arrival_time
              group by P.passenger_id) Sub
    on B.arrival_time = Sub.bus_time
 group by B.bus_id
 order by B.bus_id;