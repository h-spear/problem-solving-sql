-- https://www.hackerrank.com/challenges/the-company/problem

SELECT C.company_code AS company_code
    , C.founder AS founder
     , COUNT(DISTINCT L.lead_manager_code) AS lead_managers
     , COUNT(DISTINCT S.senior_manager_code) AS senior_managers
     , COUNT(DISTINCT M.manager_code) AS managers
     , COUNT(DISTINCT E.employee_code) AS employees
         
  FROM Company C JOIN
       Lead_Manager L JOIN
       Senior_Manager S JOIN
       Manager M JOIN
       Employee E
       
    ON L.company_code = C.company_code AND
       S.company_code = C.company_code AND
       M.company_code = C.company_code AND
       E.company_code = C.company_code
       
 GROUP BY C.company_code, C.founder
 
 ORDER BY company_code