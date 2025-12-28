-- Write your MySQL query statement below
-- TIME: O(N log N) => row_num() requires sorting
-- Space: O(N) => windows requires partitions

WITH CTE AS(
    SELECT
            customer_id,
            order_date,
            customer_pref_delivery_date,
            CASE
                WHEN order_date=customer_pref_delivery_date THEN 'immediate'
                WHEN order_date<customer_pref_delivery_date THEN 'scheduled'
            END AS 'pref',
            ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id, order_date) AS rn
    FROM delivery
)
SELECT 
        ROUND((SUM(IF(pref='immediate',1,0))/COUNT(*))*100,2) AS immediate_percentage
FROM cte WHERE rn = 1
