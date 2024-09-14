-- https://leetcode.com/problems/top-percentile-fraud/
-- percent_rank

select policy_id
     , state
     , fraud_score
  from (
        select policy_id
             , percent_rank() over (partition by state order by fraud_score desc) as pr
             , state
             , fraud_score
          from Fraud
        ) Sub
 where pr < 0.05
 order by state, fraud_score desc, policy_id;