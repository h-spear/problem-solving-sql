-- https://leetcode.com/problems/count-the-number-of-experiments/

with Platforms as (
    select 'Android' as platform
     union
    select 'IOS' as platform
     union
    select 'Web' as platform
), ExperimentNames as (
    select 'Reading' as experiment_name
     union
    select 'Sports' as experiment_name
     union
    select 'Programming' as experiment_name
), Categories as (
    select * from Platforms, ExperimentNames
)

select C.platform as platform
     , C.experiment_name as experiment_name
     , count(E.experiment_id) as num_experiments
  from Categories C
  left join Experiments E
    on C.platform = E.platform and C.experiment_name = E.experiment_name
 group by C.platform, C.experiment_name;