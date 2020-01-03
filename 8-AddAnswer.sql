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


EXEC AddAnswer '1answerId', 'answer answer answer 1', default, '3userid', '3questionId', 0
EXEC AddAnswer '2answerId', 'answer answer answer 2', default, '2userid', '1questionId', 0
EXEC AddAnswer '3answerId', 'answer answer answer 3', default, '4userid', '2questionId', 0
EXEC AddAnswer '4answerId', 'answer answer answer 4', default, '2userid', '4questionId', 0
EXEC AddAnswer '5answerId', 'answer answer answer 5', default, '3userid', '1questionId', 0
EXEC AddAnswer '6answerId', 'answer answer answer 6', default, '3userid' , '3questionId', 1
EXEC AddAnswer '7answerId', 'answer answer answer 7', default, '1userid', '5questionId', 1
EXEC AddAnswer '8answerId', 'answer answer answer 8', default, '4userid', '6questionId', 1