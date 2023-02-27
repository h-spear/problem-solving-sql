-- https://leetcode.com/problems/second-degree-follower/

WITH FollowsLeastOneUser AS(
    SELECT followee, COUNT(follower) AS num
      FROM Follow
     GROUP BY followee
    HAVING num >= 1
), FollowedByLeastOneUser AS(
    SELECT DISTINCT follower
      FROM Follow
)

SELECT F2.follower AS follower
     , F1.num AS num
  FROM FollowsLeastOneUser F1
  JOIN FollowedByLeastOneUser F2
    ON F1.followee = F2.follower
 ORDER BY follower ASC;