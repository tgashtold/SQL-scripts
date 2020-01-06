USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddWorkPosition
    @position NVARCHAR(50)
AS
BEGIN	
	IF NOT EXISTS (
		SELECT Position 
		FROM WorkPosition
		WHERE Position = @position)

	INSERT INTO WorkPosition(Position)
	VALUES(@position)
END;

GO

EXEC AddWorkPosition 'Java Developer'
EXEC AddWorkPosition 'Designer'
EXEC AddWorkPosition 'Front-end Developer'
EXEC AddWorkPosition 'Manager'




