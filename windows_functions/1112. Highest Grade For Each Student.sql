WITH CTE AS(
SELECT
        *,
        ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id) AS rn
FROM Enrollments
)

SELECT
        student_id,
        course_id,
        grade
FROM cte
WHERE rn = 1
ORDER BY student_id;

