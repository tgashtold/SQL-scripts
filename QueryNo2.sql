WITH UsersAnswersLikes AS(
SELECT Answers.Id, Answers.UserId, COUNT(AnswersLikes.AnswerId) as LikesQty FROM Answers 
JOIN AnswersLikes ON AnswersLikes.AnswerId=Answers.Id
GROUP BY Answers.Id, Answers.UserId)

SELECT ProgramUsers.Id, ProgramUsers.FirstName, ProgramUsers.LastName, COUNT(UsersAnswersLikes.LikesQty) as LikedAnswers
FROM ProgramUsers
JOIN UsersAnswersLikes ON UsersAnswersLikes.UserId = ProgramUsers.Id
GROUP BY ProgramUsers.Id, ProgramUsers.FirstName, ProgramUsers.LastName