-- https://leetcode.com/problems/tournament-winners/

with cte as (
    select P.player_id, group_id
         , rank() over (partition by group_id order by sum(score) desc, P.player_id) as group_rank
      from (select first_player as player_id
                 , first_score as score
              from Matches
             union all
            select second_player as player_id
                 , second_score as score
              from Matches) as Sub
      join Players P
        on Sub.player_id = P.player_id
     group by P.player_id
)

select group_id, player_id
  from cte
 where group_rank = 1;