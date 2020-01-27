USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddUser
	@Id NVARCHAR(20), 
	@FirstName NVARCHAR(30),
	@LastName NVARCHAR(30),
	@Email NVARCHAR(30),
	@Password NVARCHAR(20),
	@WorkExperience TINYINT,
	@WorkPosition nvarchar(50)
AS
	IF NOT EXISTS (
		SELECT Id, Email, Password
		FROM ProgramUsers
		WHERE Id = @Id OR Email = @Email OR Password = @Password)
BEGIN
	DECLARE @WorkPositionId INT;
	SET @WorkPositionId = (SELECT Id FROM WorkPosition WHERE Position = @WorkPosition)

	INSERT INTO ProgramUsers (Id, FirstName, LastName, Email, Password, WorkExperience, WorkPositionId)
	VALUES(@Id, @FirstName, @LastName, @Email, @Password, @WorkExperience, @WorkPositionId)
END

GO

EXEC AddUser '1userid', 'Ivan', 'Petrov', 'user1@mail.ru', 'password1', 2, 'Manager'
EXEC AddUser '2userid', 'Peter', 'Lomov', 'user2@mail.ru', 'password2', null, 'Java Developer'
EXEC AddUser '3userid', 'Olga', 'Savina', 'user3@mail.ru', 'password3', 0, 'Front-end Developer'
EXEC AddUser '4userid', 'Irina', 'Kostenko', 'user4@mail.ru', 'password4', 6, 'Designer'
EXEC AddUser '5userid', 'Inga', 'Shubich', 'user5@mail.ru', 'password5', null, null
