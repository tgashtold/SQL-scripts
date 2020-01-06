-- OPTION 1
SELECT ProgramUsers.id, ProgramUsers.FirstName, ProgramUsers.LastName, COUNT(*) AS UserQuestionsQty
FROM ProgramUsers
JOIN Questions ON Questions.UserId = ProgramUsers.id
GROUP BY ProgramUsers.Id, ProgramUsers.FirstName, ProgramUsers.LastName
HAVING COUNT(*) = (	
	SELECT TOP 1 COUNT(*) AS QuestionsQty
	FROM Questions
	GROUP BY UserId
	ORDER BY QuestionsQty DESC)

-- OPTION 2

--WITH UsersQuestionsQty AS (
--	SELECT COUNT(*) as QuestionsQty
--	FROM Questions
--	GROUP BY UserId
--)

--SELECT ProgramUsers.id, ProgramUsers.FirstName, ProgramUsers.LastName, COUNT(*) AS UserQuestionsQty
--FROM ProgramUsers
--JOIN Questions ON Questions.UserId = ProgramUsers.id
--GROUP BY ProgramUsers.Id, ProgramUsers.FirstName, ProgramUsers.LastName
--HAVING COUNT(*) = (SELECT MAX(QuestionsQty) FROM UsersQuestionsQty)