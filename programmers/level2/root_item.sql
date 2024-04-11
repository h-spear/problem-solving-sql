-- level2
-- https://school.programmers.co.kr/learn/courses/30/lessons/273710

SELECT I.ITEM_ID AS 'ITEM_ID'
     , I.ITEM_NAME AS 'ITEM_NAME'
  FROM ITEM_INFO I
  JOIN ITEM_TREE T
    ON I.ITEM_ID = T.ITEM_ID
 WHERE T.PARENT_ITEM_ID IS NULL
 ORDER BY I.ITEM_ID ASC;
 