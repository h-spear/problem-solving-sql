-- level2
-- https://school.programmers.co.kr/learn/courses/30/lessons/273711

SELECT T.ITEM_ID
     , I2.ITEM_NAME
     , I2.RARITY
  FROM ITEM_INFO I
  JOIN ITEM_TREE T
    ON I.ITEM_ID = T.PARENT_ITEM_ID
  JOIN ITEM_INFO I2
    ON T.ITEM_ID = I2.ITEM_ID
 WHERE I.RARITY = 'RARE'
 ORDER BY T.ITEM_ID DESC;
