-- Write your MySQL query statement below
-- Time: O(T*S)
-- Space:O(T*S)
WITH RECURSIVE nums AS (
    SELECT 1 AS subtask_id
    UNION ALL
    SELECT subtask_id + 1
    FROM nums
    WHERE subtask_id < (SELECT MAX(subtasks_count) FROM Tasks)
),

cte AS(
SELECT 
        task_id,
        subtask_id
FROM tasks t LEFT JOIN nums n ON t.subtasks_count >= n.subtask_id)

SELECT 
        a.task_id,
        a.subtask_id
FROM cte a LEFT JOIN executed b ON a.task_id=b.task_id AND a.subtask_id=b.subtask_id
WHERE (b.task_id IS NULL AND b.subtask_id IS NULL);




