CREATE OR ALTER PROCEDURE AddQuestionsHashtags
		@QuestionId NVARCHAR(20),
		@HashtagId INT
AS
BEGIN
	IF NOT EXISTS (
		SELECT QuestionId, HashtagId
		FROM QuestionsHashtags
		WHERE QuestionId=@QuestionId AND HashtagId=@HashtagId )
	INSERT INTO QuestionsHashtags(HashtagId, QuestionId)
	VALUES(@HashtagId, @QuestionId)
END


EXEC AddQuestionsHashtags 1, '1questionId'
EXEC AddQuestionsHashtags 2, '1questionId'
EXEC AddQuestionsHashtags 4, '2questionId'
EXEC AddQuestionsHashtags 6, '2questionId'
EXEC AddQuestionsHashtags 3, '3questionId'
EXEC AddQuestionsHashtags 5, '4questionId'
EXEC AddQuestionsHashtags 2, '5questionId'
EXEC AddQuestionsHashtags 3, '6questionId'
EXEC AddQuestionsHashtags 5, '1questionId'
EXEC AddQuestionsHashtags 1, '2questionId'