-- https://leetcode.com/problems/count-apples-and-oranges/

select sum(ifnull(B.apple_count, 0) + ifnull(C.apple_count, 0)) as apple_count
     , sum(ifnull(B.orange_count, 0) + ifnull(C.orange_count, 0)) as orange_count
  from Boxes B
  left join Chests C
    on B.chest_id = C.chest_id