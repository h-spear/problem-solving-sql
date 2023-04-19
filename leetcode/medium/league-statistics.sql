-- https://leetcode.com/problems/league-statistics/

SELECT team_name
     , COUNT(team_id) AS matches_played
     , SUM(CASE WHEN goal_for > goal_against THEN 3
                WHEN goal_for = goal_against THEN 1
                ELSE 0 END) AS points
     , SUM(goal_for) AS goal_for
     , SUM(goal_against) AS goal_against  
     , SUM(goal_for) - SUM(goal_against) AS goal_diff
  FROM (SELECT T.team_id AS team_id
             , T.team_name
             , IF (T.team_id = M.home_team_id, 
                   M.home_team_goals,
                   M.away_team_goals) AS goal_for
             , IF (T.team_id = M.home_team_id, 
                   M.away_team_goals,
                   M.home_team_goals) AS goal_against
          FROM Teams T
          JOIN Matches M
            ON T.team_id = M.home_team_id OR T.team_id = M.away_team_id) SUB
 GROUP BY team_id
 ORDER BY points DESC, goal_diff DESC, team_name;