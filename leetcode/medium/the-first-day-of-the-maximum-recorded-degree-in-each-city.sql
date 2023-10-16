-- https://leetcode.com/problems/the-first-day-of-the-maximum-recorded-degree-in-each-city/

select W.city_id as city_id
     , min(W.day) as day
     , W.degree as degree
  from Weather W
  join (select city_id, max(degree) as max_degree
          from Weather
         group by city_id) Sub
    on W.city_id = Sub.city_id and W.degree = Sub.max_degree
 group by W.city_id
 order by W.city_id;