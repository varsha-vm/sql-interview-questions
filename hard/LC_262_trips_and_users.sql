-- Write your MySQL query statement below
WITH CTE AS(
    SELECT
        t.status,
        t.request_at,
        CASE 
            WHEN status = 'cancelled_by_client' OR status = 'cancelled_by_driver' THEN 1 ELSE 0 
        END AS status_cancelled
FROM trips t
JOIN users u ON t.client_id = u.users_id AND u.banned = 'No'
JOIN users u1 ON t.driver_id = u1.users_id AND u1.banned = 'No'
WHERE t.request_at BETWEEN "2013-10-01" and "2013-10-03"

)

SELECT
        request_at AS Day,
        ROUND(AVG(status_cancelled),2) AS 'Cancellation Rate'
FROM CTE 
GROUP BY DATE(request_at)
ORDER BY DATE(request_at)

