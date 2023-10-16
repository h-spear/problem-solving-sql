-- https://leetcode.com/problems/number-of-times-a-driver-was-a-passenger/

select distinct driver_id,
       ifnull(cnt, 0) as cnt
  from Rides R
  left join (select passenger_id, count(passenger_id) as cnt
               from Rides
              group by passenger_id) Sub
    on R.driver_id = Sub.passenger_id;