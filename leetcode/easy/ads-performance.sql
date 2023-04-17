-- https://leetcode.com/problems/ads-performance/

SELECT ad_id
     , IF (
       COUNT(CASE WHEN action = 'Clicked' THEN 1 END) + COUNT(CASE WHEN action = 'Viewed' THEN 1 END) = 0,
       0,
       ROUND(COUNT(CASE WHEN action = 'Clicked' THEN 1 END) * 100 /
              (COUNT(CASE WHEN action = 'Clicked' THEN 1 END) + COUNT(CASE WHEN action = 'Viewed' THEN 1 END))
            , 2)
     ) AS ctr
  FROM Ads
 GROUP BY ad_id
 ORDER BY ctr DESC, ad_id ASC;