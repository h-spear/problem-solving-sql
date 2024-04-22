-- https://leetcode.com/problems/find-trending-hashtags/
-- *** SUBSTRING_INDEX 

select concat('#', substring_index(substring_index(tweet, '#', -1), ' ', 1)) as `hashtag`
     , count(tweet_id) as `hashtag_count`
  from Tweets
 group by `hashtag`
 order by `hashtag_count` desc, `hashtag` desc
 limit 3;