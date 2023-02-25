-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/131124

-- 1차 풀이
SELECT MEMBER_NAME AS MEMBER_NAME
     , REVIEW_TEXT AS REVIEW_TEXT
     , DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE

  FROM MEMBER_PROFILE MP
  JOIN REST_REVIEW RR
    ON MP.MEMBER_ID = RR.MEMBER_ID

 WHERE RR.MEMBER_ID IN (SELECT MEMBER_ID
                          FROM REST_REVIEW
                         GROUP BY MEMBER_ID
                        HAVING COUNT(MEMBER_ID) = (SELECT MAX(COUNT)
                                                     FROM (SELECT COUNT(MEMBER_ID) AS COUNT
                                                             FROM REST_REVIEW
                                                            GROUP BY MEMBER_ID) SUB))
 ORDER BY REVIEW_DATE;
 

-- 개선 : ORDER BY, LIMIT를 사용해서 서브쿼리 1개 줄임
SELECT MEMBER_NAME AS MEMBER_NAME
     , REVIEW_TEXT AS REVIEW_TEXT
     , DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE

  FROM MEMBER_PROFILE MP
  JOIN REST_REVIEW RR
    ON MP.MEMBER_ID = RR.MEMBER_ID

 WHERE RR.MEMBER_ID IN (SELECT MEMBER_ID
                          FROM REST_REVIEW
                         GROUP BY MEMBER_ID
                        HAVING COUNT(MEMBER_ID) = (SELECT COUNT(MEMBER_ID) AS CNT
                                                             FROM REST_REVIEW
                                                            GROUP BY MEMBER_ID
                                                    ORDER BY CNT DESC 
                                                    LIMIT 1) )
 ORDER BY REVIEW_DATE;


-- 리뷰를 가장 많이 작성한 회원 1명의 리뷰들만 조회해도 정답
SELECT MEMBER_NAME AS MEMBER_NAME
     , REVIEW_TEXT AS REVIEW_TEXT
     , DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE

  FROM MEMBER_PROFILE MP
  JOIN REST_REVIEW RR
    ON MP.MEMBER_ID = RR.MEMBER_ID

 WHERE RR.MEMBER_ID = (SELECT MEMBER_ID
                         FROM REST_REVIEW
                        GROUP BY MEMBER_ID
                        ORDER BY COUNT(MEMBER_ID) DESC
                        LIMIT 1)
 ORDER BY REVIEW_DATE;