-- Write your MySQL query statement below
-- Time: O(N)
-- Space:O(N)

WITH CTE AS(
SELECT
        a.product_id,
        (a.price*b.units) AS numerator,
        b.units 
FROM prices a
LEFT JOIN unitssold b ON a.product_id=b.product_id 
AND b.purchase_date BETWEEN a.start_date AND a.end_date
)

SELECT 
        product_id,
        IFNULL(ROUND(SUM(numerator)/SUM(units), 2), 0 )AS average_price
FROM cte
GROUP BY product_id;

