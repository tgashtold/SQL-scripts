CREATE OR ALTER PROCEDURE AddQuestion
		@Id NVARCHAR(20),
		@Title NVARCHAR(500),
		@Description VARCHAR(2000),
		@Date DATETIME,
		@UserId NVARCHAR(20),
		@IsClosed BIT
AS
BEGIN
	IF NOT EXISTS (
		SELECT Id, Title, Description
		FROM Questions
		WHERE Id=@Id AND Title=@Title AND Description=@Description )
	INSERT INTO Questions(Id, Title, Description,Date, UserId, IsClosed)
	VALUES(@Id, @Title, @Description,@Date, @UserId, @IsClosed)
END


EXEC AddQuestion '1questionId', 'title of 1st question', 'description question 1', DEFAULT, '1userid', 0
EXEC AddQuestion '2questionId', 'title of 2nd question', 'description question 2', DEFAULT, '2userid', 0
EXEC AddQuestion '3questionId', 'title of 3rd question', 'description question 3',DEFAULT, '2userid', 1
EXEC AddQuestion '4questionId', 'title of 4th question', 'description question 4', DEFAULT,'4userid', 0
EXEC AddQuestion '5questionId', 'title of 5th question', 'description question 5',DEFAULT, '3userid', 1
EXEC AddQuestion '6questionId', 'title of 6 question', 'description question 6', DEFAULT, '3userid', 1