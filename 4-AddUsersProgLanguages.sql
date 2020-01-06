USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddUsersProgLanguages
	@UserId NVARCHAR(20),
	@ProgLanguage NVARCHAR(30)
AS
BEGIN
	DECLARE @ProgLanguageId INT;
	SET @ProgLanguageId=(SELECT Id FROM ProgLanguages WHERE Language = @ProgLanguage)

	IF NOT EXISTS (
		SELECT *
		FROM UsersProgLanguages
		WHERE UserId = @UserId AND ProgLanguageId=@ProgLanguageId )
	INSERT INTO UsersProgLanguages(UserId, ProgLanguageId)
	VALUES(@UserId, @ProgLanguageId)
END

GO

EXEC AddUsersProgLanguages '1userid', 'Java'
EXEC AddUsersProgLanguages '1userid', 'JS'
EXEC AddUsersProgLanguages '1userid', 'Python'
EXEC AddUsersProgLanguages '2userid', 'C#'
EXEC AddUsersProgLanguages '2userid', 'TS'
EXEC AddUsersProgLanguages '4userid', 'React'
EXEC AddUsersProgLanguages '4userid', 'Python'
EXEC AddUsersProgLanguages '4userid', 'TS'
