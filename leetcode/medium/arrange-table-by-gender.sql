-- https://leetcode.com/problems/arrange-table-by-gender/

SELECT user_id, gender

  FROM (SELECT user_id
             , gender
             , ROW_NUMBER() OVER (PARTITION BY gender ORDER BY user_id) AS idx
             , (CASE WHEN gender = 'female' THEN 1
                     WHEN gender = 'other' THEN 2
                     WHEN gender = 'male' THEN 3 END) AS gender_num
          FROM Genders) Sub

 ORDER BY idx, gender_num;


-- Solution2 (Female, Other, Male 길이 순)
 SELECT user_id
     , gender
  FROM Genders
 ORDER BY ROW_NUMBER() OVER (PARTITION BY gender ORDER BY user_id), 
          LENGTH(gender) DESC;