WITH UsersQuestionsQty AS (
SELECT UserId, 
COUNT(*) as QuestionsQty
FROM Questions
GROUP BY UserId
)

SELECT * 
FROM ProgramUsers
WHERE ProgramUsers.Id=SOME(
SELECT UserId FROM UsersQuestionsQty
WHERE QuestionsQty=(
SELECT MAX(QuestionsQty) FROM UsersQuestionsQty)
)

