-- Write your MySQL query statement below

WITH CTE AS(
SELECT
        question_id,
        SUM(action = 'answer')/SUM(action = 'show') as answer_rate
FROM surveylog
GROUP BY question_id

)

SELECT
        question_id AS survey_log
FROM CTE
ORDER BY answer_rate DESC, question_id 
LIMIT 1