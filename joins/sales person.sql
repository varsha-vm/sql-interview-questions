-- Write your query below
WITH non_orders AS(
SELECT
        o.sales_id
FROM ORDERS o JOIN company c ON c.com_id = o.com_id
WHERE c.name = 'CRIMSON'
)

SELECT
        name
FROM sales_person
WHERE sales_id NOT IN (SELECT sales_id FROM non_orders);
