-- https://leetcode.com/problems/get-highest-answer-rate-question/

WITH Temp AS (
    SELECT question_id, 
        COUNT(CASE WHEN action = 'answer' THEN 1 END) /
        COUNT(CASE WHEN action = 'show' THEN 1 END) AS answer_rate
    FROM SurveyLog
    GROUP BY question_id
    ORDER BY answer_rate DESC, question_id
    LIMIT 1
)

SELECT question_id AS survey_log
  FROM Temp;