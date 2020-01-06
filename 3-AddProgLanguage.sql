USE ProgAssistant

GO

CREATE OR ALTER PROCEDURE AddProgLanguage
	@Language NVARCHAR(30)
AS
BEGIN
	IF NOT EXISTS (
		SELECT Language
		FROM ProgLanguages
		WHERE Language = @Language)
	INSERT INTO ProgLanguages(Language)
	VALUES(@Language)
END

GO

EXEC AddProgLanguage 'Java'
EXEC AddProgLanguage 'JS'
EXEC AddProgLanguage 'Python'
EXEC AddProgLanguage 'C#'
EXEC AddProgLanguage 'C++'
EXEC AddProgLanguage 'TS'
EXEC AddProgLanguage 'React'