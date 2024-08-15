-- https://leetcode.com/problems/premier-league-table-ranking-ii/

select team_name
     , 3 * wins + draws as 'points'
     , rank() over (order by 3 * wins + draws desc) as 'position'
     , case when (rank() over (order by 3 * wins + draws desc) - 1) / (select count(team_id) from TeamStats) <= 0.33 
            then 'Tier 1'
            when (rank() over (order by 3 * wins + draws desc) - 1) / (select count(team_id) from TeamStats) <= 0.66
            then 'Tier 2'
            else 'Tier 3'
            end as 'tier'
  from TeamStats
 order by points desc, team_name;