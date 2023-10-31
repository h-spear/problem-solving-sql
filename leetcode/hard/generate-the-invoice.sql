-- https://leetcode.com/problems/generate-the-invoice/

with cte as (
    select invoice_id, P.product_id, quantity, price
      from Products P
      join Purchases Pu
        on P.product_id = Pu.product_id
)

select product_id, quantity, (price * quantity) as price
  from cte
  join (select invoice_id
          from cte
         group by invoice_id
         order by sum(price * quantity) desc, invoice_id
         limit 1) sub
    on cte.invoice_id = sub.invoice_id;