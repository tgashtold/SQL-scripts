USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddQuestionsHashtags
	@Hashtag NVARCHAR(50),
	@QuestionId NVARCHAR(20)
AS
BEGIN
	DECLARE @HashtagId INT;
	SET @HashtagId = (SELECT Id FROM Hashtags WHERE Hashtag = @Hashtag);

	IF NOT EXISTS (
		SELECT QuestionId, HashtagId
		FROM QuestionsHashtags
		WHERE QuestionId=@QuestionId AND HashtagId=@HashtagId )
	INSERT INTO QuestionsHashtags(HashtagId, QuestionId)
	VALUES(@HashtagId, @QuestionId)
END

GO

EXEC AddQuestionsHashtags 'datpe', '1questionId'
EXEC AddQuestionsHashtags 'defaultvalue', '1questionId'
EXEC AddQuestionsHashtags 'createrequest', '2questionId'
EXEC AddQuestionsHashtags 'filterbydate', '2questionId'
EXEC AddQuestionsHashtags 'boolean', '3questionId'
EXEC AddQuestionsHashtags 'deleteMatches', '4questionId'
EXEC AddQuestionsHashtags 'filterbydate', '5questionId'
EXEC AddQuestionsHashtags 'deleteMatches', '6questionId'
EXEC AddQuestionsHashtags 'filterbydate', '1questionId'
EXEC AddQuestionsHashtags 'defaultvalue', '2questionId'