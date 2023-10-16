-- https://leetcode.com/problems/election-results/

select candidate
  from (select candidate, dense_rank() over (order by sum(vote) desc) as r
          from Votes V
          join (select voter, 1/count(voter) as vote
                  from Votes
                 group by voter) Sub
            on V.voter = Sub.voter
         where candidate is not null
         group by candidate) t
 where r = 1
 order by candidate;