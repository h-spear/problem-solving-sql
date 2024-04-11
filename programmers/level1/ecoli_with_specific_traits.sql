-- level1
-- https://school.programmers.co.kr/learn/courses/30/lessons/301646

SELECT COUNT(ID) AS `COUNT`
  FROM ECOLI_DATA
 WHERE ((GENOTYPE & 5) > 0) AND ((GENOTYPE & 2) = 0);
