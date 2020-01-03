CREATE OR ALTER PROCEDURE AddUser
        @Id NVARCHAR(20), 
		@FirstName NVARCHAR(30),
		@LastName NVARCHAR(30),
		@Email NVARCHAR(30),
		@Password NVARCHAR(20),
		@WorkExperience TINYINT,
		@WorkPositionId INT
AS
BEGIN
	IF NOT EXISTS (
		SELECT Id, Email, Password
		FROM ProgramUsers
		WHERE Id = @Id OR Email = @Email OR Password = @Password)
	INSERT INTO ProgramUsers (Id, FirstName, LastName, Email, Password, WorkExperience, WorkPositionId)
	VALUES(@Id, @FirstName, @LastName, @Email, @Password, @WorkExperience, @WorkPositionId)
END



EXEC AddUser '1userid', 'Ivan', 'Petrov', 'user1@mail.ru', 'password1', 2, 3
EXEC AddUser '2userid', 'Peter', 'Lomov', 'user2@mail.ru', 'password2', null, 1
EXEC AddUser '3userid', 'Olga', 'Savina', 'user3@mail.ru', 'password3', 0, 2
EXEC AddUser '4userid', 'Irina', 'Kostenko', 'user4@mail.ru', 'password4', 6, 4