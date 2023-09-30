-- https://leetcode.com/problems/total-traveled-distance/

select U.user_id as user_id
     , U.name as name
     , ifnull(sum(R.distance), 0) as 'traveled distance'
  from Users U
  left join Rides R
    on U.user_Id = R.user_id
 group by U.user_id
 order by U.user_id;