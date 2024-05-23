-- https://leetcode.com/problems/invalid-tweets-ii/
-- 특정 문자열 개수 세기

select tweet_id
  from Tweets 
 where char_length(content) > 140 or 
       char_length(content) - char_length(replace(content, '#', '')) > 3 or 
       char_length(content) - char_length(replace(content, '@', '')) > 3
 order by tweet_id;