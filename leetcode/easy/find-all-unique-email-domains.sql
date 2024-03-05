--https://leetcode.com/problems/find-all-unique-email-domains/

SELECT SUBSTR(email, LOCATE('@', email) + 1) AS email_domain
     , COUNT(*) AS count
  FROM Emails
 WHERE RIGHT(email, 4) = '.com'
 GROUP BY email_domain
 ORDER BY email_domain;