-- Write your query below

SELECT
        e.left_operand,
        e.operator,
        e.right_operand,
        CASE
            WHEN e.operator = '>' AND lv.value > rv.value THEN 'true'
            WHEN e.operator = '<' AND lv.value < rv.value THEN 'true'
            WHEN e.operator = '=' AND lv.value = rv.value THEN 'true'
            ELSE 'false'
        END AS value
FROM variables lv JOIN expressions e ON lv.name = e.left_operand 
JOIN variables rv ON rv.name = e.right_operand;

