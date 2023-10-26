-- https://leetcode.com/problems/immediate-food-delivery-iii/

select order_date
     , round(count(case when order_date = customer_pref_delivery_date then 1 end) * 100
                / count(*), 2) as immediate_percentage
  from Delivery
 group by order_date
 order by order_date;