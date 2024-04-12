-- level3
-- https://school.programmers.co.kr/learn/courses/30/lessons/273712

SELECT ITEM_ID
     , ITEM_NAME
     , RARITY
  FROM ITEM_INFO
 WHERE ITEM_ID NOT IN (SELECT DISTINCT PARENT_ITEM_ID AS UPGRADABLE_ITEM_ID
                         FROM ITEM_TREE
                        WHERE PARENT_ITEM_ID IS NOT NULL)
 ORDER BY ITEM_ID DESC;
  