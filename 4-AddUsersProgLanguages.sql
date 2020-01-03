CREATE OR ALTER PROCEDURE AddUsersProgLanguages
		@UserId NVARCHAR(20),
		@ProgLanguageId INT
AS
BEGIN
	IF NOT EXISTS (
		SELECT *
		FROM UsersProgLanguages
		WHERE UserId = @UserId AND ProgLanguageId=@ProgLanguageId )
	INSERT INTO UsersProgLanguages(UserId, ProgLanguageId)
	VALUES(@UserId, @ProgLanguageId)
END

EXEC AddUsersProgLanguages '1userid', 2
EXEC AddUsersProgLanguages '1userid', 3
EXEC AddUsersProgLanguages '1userid', 7
EXEC AddUsersProgLanguages '2userid', 1
EXEC AddUsersProgLanguages '2userid', 4
EXEC AddUsersProgLanguages '3userid', 2
EXEC AddUsersProgLanguages '4userid', 3
EXEC AddUsersProgLanguages '4userid', 6
EXEC AddUsersProgLanguages '4userid', 5
