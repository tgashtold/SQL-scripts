CREATE OR ALTER PROCEDURE AddHashtag
	@Hashtag NVARCHAR(50)
AS
BEGIN
	IF NOT EXISTS (
		SELECT Hashtag
		FROM Hashtags
		WHERE Hashtag=@Hashtag )
	INSERT INTO Hashtags(Hashtag)
	VALUES(@Hashtag)
END

EXEC AddHashtag 'datpe'
EXEC AddHashtag 'defaultvalue'
EXEC AddHashtag 'createrequest'
EXEC AddHashtag 'filterbydate'
EXEC AddHashtag 'boolean'
EXEC AddHashtag 'deleteMatches'

