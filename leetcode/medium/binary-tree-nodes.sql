-- https://leetcode.com/problems/binary-tree-nodes/

select N
     , (case when P is null then 'Root'
             when (select count(*) from Tree where P = t.N) > 0 then 'Inner'
             else 'Leaf' end) as `Type`
  from Tree T
 order by N;