-- https://leetcode.com/problems/find-longest-calls/
-- https://leetcode.com/problems/find-longest-calls/solutions/5064643/mysql-beats-100-00/
-- *** LPAD(원본 문자열, 자릿수, 채울 문자열)

select first_name
     , type
     , duration_formatted
  from (
        select Con.id
             , Con.first_name
             , C.type
             , concat(lpad(floor(C.duration / 3600), 2, '0'), ':'
                    , lpad(floor((C.duration % 3600) / 60), 2, '0'), ':'
                    , lpad(floor(C.duration % 60), 2, '0')) as `duration_formatted`
             , rank() over (partition by C.type order by duration desc) `rank`
          from Contacts Con
          join Calls C
            on Con.id = C.contact_id) sub
 where `rank` <= 3
 order by type, duration_formatted desc, first_name desc;