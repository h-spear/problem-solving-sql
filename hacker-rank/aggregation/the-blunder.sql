-- https://www.hackerrank.com/challenges/the-blunder/problem
-- https://junyoung-developer.tistory.com/85

SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES