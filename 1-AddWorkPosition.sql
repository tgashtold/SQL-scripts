CREATE OR ALTER PROCEDURE AddWorkPosition
    @position NVARCHAR(50)
AS
BEGIN
	IF NOT EXISTS (
		SELECT Position 
		FROM WorkPosition
		WHERE Position = @position)
	INSERT INTO WorkPosition
	VALUES(@position)
END;

EXEC AddWorkPosition 'Java Developer'
EXEC AddWorkPosition 'Designer'
EXEC AddWorkPosition 'Front-end Developer'
EXEC AddWorkPosition 'Manager'
