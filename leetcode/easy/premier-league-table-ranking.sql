-- https://leetcode.com/problems/premier-league-table-ranking/

select team_id
     , team_name
     , 3 * wins + draws as 'points'
     , rank() over (order by 3 * wins + draws desc) as 'position'
  from TeamStats
 order by points desc, team_name;