-- https://leetcode.com/problems/investments-in-2016/

SELECT ROUND(SUM(tiv_2016), 2) AS "tiv_2016"
FROM Insurance I
WHERE 1=1
    AND (
        SELECT COUNT(pid) 
        FROM Insurance 
        WHERE tiv_2015 = I.tiv_2015
        ) > 1

    AND NOT EXISTS (
        SELECT lat, lon 
        FROM Insurance
        WHERE PID <> I.PID AND lat = I.lat AND lon = I.lon)
