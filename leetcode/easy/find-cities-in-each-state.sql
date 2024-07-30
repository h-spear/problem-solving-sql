-- https://leetcode.com/problems/find-cities-in-each-state/
-- group_concat

select state
     , group_concat(city order by city separator ', ') as 'cities'
  from cities
 group by state
 order by state;