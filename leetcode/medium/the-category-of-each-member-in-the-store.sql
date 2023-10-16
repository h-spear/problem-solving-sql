-- https://leetcode.com/problems/the-category-of-each-member-in-the-store/

select M.member_id
     , M.name
     , case when (count(P.visit_id) * 100) / count(V.visit_id) >= 80 then 'Diamond'
            when (count(P.visit_id) * 100) / count(V.visit_id) >= 50 then 'Gold'
            when (count(P.visit_id) * 100) / count(V.visit_id) >= 0 then 'Silver'
            else 'Bronze'
        end as category
  from Members M
  left join Visits V
    on M.member_id = V.member_id
  left join Purchases P
    on V.visit_id = P.visit_id
 group by M.member_id;