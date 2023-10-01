-- https://leetcode.com/problems/product-sales-analysis-iv/

with SalesProduct as (
    select S.product_id, S.user_id, sum(S.quantity) as quantity, max(P.price) as price
      from Sales S
      join Product P
        on S.product_id = P.product_id
     group by S.user_id, S.product_id
)

select SP.user_id, SP.product_id
  from SalesProduct SP
  join (select user_id, max(quantity * price) as most_money
          from SalesProduct
         group by user_id) Sub
    on SP.user_id = Sub.user_id
 where quantity * price = Sub.most_money
 group by SP.user_id, SP.product_id;