-- https://leetcode.com/problems/count-occurrences-in-text/

select 'bull' as word
     , count(case when content like '% bull %' then 1 end) as count
  from Files
 union
select 'bear' as word
     , count(case when content like '% bear %' then 1 end) as count
  from Files;