-- https://leetcode.com/problems/compute-the-rank-as-a-percentage/

-- RANK : 동일하면 중복 순위를 부여하고, 다음 순위는 중복된 개수만큼 건너뜀
-- DENSE_RANK : 동일하면 중복 순위를 부여하고, 다음 순위는 중복 순위와 상관없이 순차적으로 반환한다.

SELECT S.student_id AS student_id
     , S.department_id AS department_id 
     , IF(Sub.number_of_students > 1,

          ROUND((RANK() OVER (PARTITION BY S.department_id ORDER BY mark DESC) - 1) * 100 / 
                    (Sub.number_of_students - 1)
                , 2),
          
          0) AS percentage

  FROM Students S
  JOIN (SELECT department_id, COUNT(department_id) AS number_of_students
          FROM Students
         GROUP BY department_id) Sub
    ON S.department_id = Sub.department_id;