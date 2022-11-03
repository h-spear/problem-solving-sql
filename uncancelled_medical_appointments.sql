-- level4
-- https://school.programmers.co.kr/learn/courses/30/lessons/132204

SELECT A.APNT_NO AS APNT_NO
     , P.PT_NAME AS PT_NAME
     , P.PT_NO AS PT_NO
     , A.MCDP_CD AS MCDP_CD
     , D.DR_NAME AS DR_NAME
     , A.APNT_YMD AS APNT_YMD
     
  FROM APPOINTMENT A
  JOIN PATIENT P
    ON A.PT_NO = P.PT_NO
    
  JOIN DOCTOR D
    ON A.MDDR_ID = D.DR_ID
    
 WHERE YEAR(A.APNT_YMD) = 2022 AND
       MONTH(A.APNT_YMD) = 4 AND 
       DAY(A.APNT_YMD) = 13 AND
       A.APNT_CNCL_YMD IS NULL AND 
       A.MCDP_CD = 'CS'
       
 ORDER BY APNT_YMD;
