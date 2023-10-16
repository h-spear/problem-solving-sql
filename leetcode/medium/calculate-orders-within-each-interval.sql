-- https://leetcode.com/problems/calculate-orders-within-each-interval/

select (@val := @val + 1) as interval_no
     , sum(order_count) as total_orders
  from Orders, (select @val:=0) Variable
 group by ceil(minute / 6)
 order by interval_no;