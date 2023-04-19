-- https://leetcode.com/problems/number-of-trusted-contacts-of-a-customer/ 
-- Beats 99.83%

SELECT I.invoice_id AS invoice_id
     , C.customer_name AS customer_name
     , I.price AS price
     , COUNT(CT.user_id) AS contacts_cnt
     , COUNT(C2.customer_id) AS trusted_contacts_cnt
  FROM Invoices I
  LEFT JOIN Customers C
    ON I.user_id = C.customer_id
  LEFT JOIN Contacts CT
    ON I.user_id = CT.user_id
  LEFT JOIN Customers C2
    ON CT.contact_email = C2.email
 GROUP BY I.invoice_id
 ORDER BY I.invoice_id;