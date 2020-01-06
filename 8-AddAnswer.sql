USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddAnswer
	@Id NVARCHAR(20),
	@Text NVARCHAR(2000),
	@Date DATETIME,
	@UserId NVARCHAR(20),
	@QuestionId NVARCHAR(20),
	@IsAccepted BIT
AS
BEGIN
	IF NOT EXISTS (
		SELECT Id, Text, UserId, QuestionId
		FROM Answers
		WHERE Id=@Id AND Text=@Text AND UserId=@UserId AND QuestionId=@QuestionId )
	INSERT INTO Answers (Id, Text, Date, UserId, QuestionId, IsAccepted)
	VALUES(@Id, @Text, @Date, @UserId, @QuestionId, @IsAccepted)
END

GO

EXEC AddAnswer '1answerId', 'answer answer answer 1', '2019-02-11 18:14:55.830', '3userid', '3questionId', 0
EXEC AddAnswer '2answerId', 'answer answer answer 2', '2019-11-26 15:34:55.830', '2userid', '1questionId', 0
EXEC AddAnswer '3answerId', 'answer answer answer 3', '2019-07-22 18:37:55.830', '4userid', '2questionId', 0
EXEC AddAnswer '4answerId', 'answer answer answer 4', '2019-04-28 18:24:55.830', '2userid', '4questionId', 0
EXEC AddAnswer '5answerId', 'answer answer answer 5', '2019-08-25 19:34:55.830', '3userid', '1questionId', 0
EXEC AddAnswer '6answerId', 'answer answer answer 6', '2019-02-23 16:54:55.830', '3userid' , '3questionId', 1
EXEC AddAnswer '7answerId', 'answer answer answer 7', '2019-12-20 12:34:55.830', '1userid', '5questionId', 1
EXEC AddAnswer '8answerId', 'answer answer answer 8', '2019-11-27 19:14:55.830', '4userid', '6questionId', 1