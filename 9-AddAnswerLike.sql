USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddAnswerLike
	@UserId NVARCHAR(20),
	@AnswerId NVARCHAR(20)
AS
BEGIN
	IF NOT EXISTS (
		SELECT *
		FROM AnswersLikes
		WHERE UserId=@UserId AND AnswerId=@AnswerId )
	INSERT INTO AnswersLikes (UserId, AnswerId)
	VALUES(@UserId, @AnswerId)
END

GO

EXEC AddAnswerLike '4userid','1answerId'
EXEC AddAnswerLike '3userid','2answerId'
EXEC AddAnswerLike '2userid','3answerId'
EXEC AddAnswerLike '4userid','4answerId'
EXEC AddAnswerLike '1userid','5answerId'
EXEC AddAnswerLike '2userid','6answerId'
EXEC AddAnswerLike '2userid','7answerId'
EXEC AddAnswerLike '1userid','1answerId'
EXEC AddAnswerLike '1userid','2answerId'
EXEC AddAnswerLike '4userid','2answerId'
EXEC AddAnswerLike '3userid','4answerId'
EXEC AddAnswerLike '1userid','6answerId'




