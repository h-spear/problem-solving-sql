-- https://leetcode.com/problems/team-scores-in-football-tournament/

with cte as(
    select case when host_goals > guest_goals then host_team else guest_team end team_id, 3 as num_point
    from Matches
    where host_goals != guest_goals
    union all
    select host_team, 1 as num_point
    from Matches
    where host_goals = guest_goals
    union all
    select guest_team, 1 as num_point
    from Matches
    where host_goals = guest_goals
)

select T.team_id as team_id
     , T.team_name as team_name
     , ifnull(sum(M.num_point), 0) as num_points
  from Teams T
  left join cte M
    on T.team_id = M.team_id
 group by T.team_id
 order by num_points desc, team_id;