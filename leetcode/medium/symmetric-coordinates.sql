-- https://leetcode.com/problems/symmetric-coordinates/

select C1.x, C1.y
  from Coordinates C1
  join Coordinates C2
    on C1.x = C2.y and C1.y = C2.x
 where C1.x <= C1.y
 group by C1.x, C1.y
having if(C1.x <> C1.y, 2, count(*)) > 1
 order by C1.x, C1.y;