-- Write your query below
WITH top_scores AS(
SELECT
        *,
        DENSE_RANK() OVER(PARTITION BY student_id ORDER BY score DESC, exam_id) as rnk
FROM exam_results
)

SELECT
        student_id,
        exam_id,
        score
FROM top_scores
WHERE rnk = 1
ORDER BY student_id
