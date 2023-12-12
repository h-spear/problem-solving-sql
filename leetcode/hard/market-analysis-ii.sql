-- https://leetcode.com/problems/market-analysis-ii/


-- 3837ms
SELECT user_id AS seller_id
     , IF (SUB.seller_id IS NULL, 'no', 'yes') AS 2nd_item_fav_brand
  FROM Users U
  LEFT JOIN(SELECT seller_id
            FROM (SELECT seller_id, favorite_brand, I.item_id, I.item_brand
                        , RANK() OVER (PARTITION BY seller_id ORDER BY order_date) as r
                    FROM Users U
                    JOIN Orders O
                        ON U.user_id = O.seller_id
                    JOIN Items I
                        ON O.item_id = I.item_id
                    ORDER BY seller_id) SUB2
            WHERE r = 2 AND favorite_brand = item_brand) SUB
    ON U.user_id = SUB.seller_id


-- 4897ms
SELECT user_id AS seller_id
     , CASE WHEN favorite_brand = (SELECT I.item_brand
                                     FROM Orders O
                                     JOIN Items I
                                       ON O.item_id = I.item_id
                                    WHERE O.seller_id = user_id
                                    ORDER BY order_date
                                    LIMIT 1 OFFSET 1)
            THEN 'yes' ELSE 'no' END AS 2nd_item_fav_brand
  FROM Users;