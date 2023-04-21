-- https://leetcode.com/problems/account-balance/

SELECT account_id, day, balance
  FROM (SELECT account_id, day
             , IF(@id <> account_id, 
                  @val := amount,
                  @val := @val + IF(type = 'deposit', +amount, -amount)) AS balance
             , @id := account_id
          FROM Transactions, (SELECT @val := 0, @id := 0) Variable
         ORDER BY account_id, day) Sub
 ORDER BY account_id, day;


-- Window Function
-- SUM OVER PARTITION BY : 조건별 누계
SELECT account_id
    , day
    , SUM(IF(type = 'deposit', +amount, -amount)) OVER (PARTITION BY account_id ORDER BY day ASC) AS balance
FROM Transactions;