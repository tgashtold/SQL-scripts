USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddQuestion
	@Id NVARCHAR(20),
	@Title NVARCHAR(500),
	@Description VARCHAR(2000),
	@UserId NVARCHAR(20),
	@IsClosed BIT,
	@Date DATETIME 
AS
	IF NOT EXISTS (
		SELECT Id, Title, Description
		FROM Questions
		WHERE Id=@Id AND Title=@Title AND Description=@Description )
		BEGIN
	INSERT INTO Questions(Id, Title, Description, UserId, IsClosed, Date)
	VALUES(@Id, @Title, @Description, @UserId, @IsClosed, @Date)
END

GO

EXEC AddQuestion '1questionId', 'title of 1st question', 'description question 1', '1userid', 0, '2019-07-18 21:34:55.830'
EXEC AddQuestion '2questionId', 'title of 2nd question', 'description question 2', '2userid', 0, '2019-07-20 17:34:55.830'
EXEC AddQuestion '3questionId', 'title of 3rd question', 'description question 3', '2userid', 1, '2019-07-11 20:34:55.830'
EXEC AddQuestion '4questionId', 'title of 4th question', 'description question 4', '4userid', 0, '2019-07-28 21:34:55.830'
EXEC AddQuestion '5questionId', 'title of 5th question', 'description question 5',  '3userid', 1, '2019-07-20 11:34:55.830'
EXEC AddQuestion '6questionId', 'title of 6 question', 'description question 6',  '3userid', 1, '2019-07-21 21:34:55.830'