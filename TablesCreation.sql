IF NOT EXISTS (
	SELECT * 
	FROM sysdatabases 
	WHERE name = 'ProgAssistant' )
CREATE DATABASE ProgAssistant;

GO

USE ProgAssistant;

IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'WorkPosition'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE WorkPosition(
		Id INT PRIMARY KEY IDENTITY NOT NULL,
		Position NVARCHAR(50) NOT NULL, 
		CONSTRAINT CK_WorkPosition_Position CHECK(Position !=''),
	);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'ProgramUsers'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE ProgramUsers(
		Id NVARCHAR(20) PRIMARY KEY NOT NULL,
		FirstName NVARCHAR(30) NOT NULL,
		LastName NVARCHAR(30) NOT NULL,
		Email NVARCHAR(30) UNIQUE NOT NULL ,
		Password NVARCHAR(20) UNIQUE NOT NULL,
		WorkExperience TINYINT,
		WorkPositionId INT NOT NULL REFERENCES WorkPosition (Id) ON DELETE CASCADE,
		CONSTRAINT CK_ProgramUsers_Email CHECK(Email !=''),
		CONSTRAINT CK_ProgramUsers_Password CHECK(Password !=''),
		CONSTRAINT CK_ProgramUsers_WorkExperience CHECK(WorkExperience >=0),
	);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'ProgLanguages'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE ProgLanguages(
		Id INT PRIMARY KEY IDENTITY NOT NULL,
		Language NVARCHAR(30) UNIQUE NOT NULL,
		CONSTRAINT CK_ProgLanguanges_Language CHECK (Language !=''),
	);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'UsersProgLanguages'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE UsersProgLanguages(
		UserId NVARCHAR(20) NOT NULL REFERENCES ProgramUsers (Id) ON DELETE CASCADE,
		ProgLanguageId INT NOT NULL REFERENCES ProgLanguages (Id) ON DELETE CASCADE,
	);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'Questions'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE Questions(
		Id NVARCHAR(20) PRIMARY KEY NOT NULL,
		Title NVARCHAR(500) NOT NULL,
		Description VARCHAR(2000) NOT NULL,
		Date DATETIME NOT NULL CONSTRAINT DF_Questions_Date DEFAULT GETDATE(),
		UserId NVARCHAR(20) NOT NULL REFERENCES ProgramUsers (Id) ON DELETE CASCADE,
		IsClosed BIT NOT NULL CONSTRAINT DF_Questions_IsClosed DEFAULT 0,
		CONSTRAINT CK_Questions_Title CHECK (Title !=''),
		CONSTRAINT CK_Questions_Description CHECK (Description !=''),
		);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'Hashtags'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE Hashtags(
		Id INT PRIMARY KEY IDENTITY NOT NULL,
		Hashtag NVARCHAR(50) UNIQUE NOT NULL,
		CONSTRAINT CK_Hashtags_Hashtag CHECK (Hashtag !=''),
	);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'QuestionsHashtags'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE QuestionsHashtags(
		QuestionId NVARCHAR(20) NOT NULL REFERENCES Questions (Id) ON DELETE CASCADE,
		HashtagId INT NOT NULL REFERENCES Hashtags (Id) ON DELETE CASCADE,
	);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'Answers'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE Answers(
		Id NVARCHAR(20) PRIMARY KEY NOT NULL,
		Text NVARCHAR(2000) NOT NULL,
		Date DATETIME NOT NULL CONSTRAINT DF_Answers_Date DEFAULT GETDATE(),
		UserId NVARCHAR(20) NOT NULL REFERENCES ProgramUsers (Id) ON DELETE CASCADE,
		QuestionId NVARCHAR(20) NOT NULL REFERENCES Questions (Id),
		IsAccepted BIT NOT NULL CONSTRAINT DF_Questions_IsAccepted DEFAULT 0,
		CONSTRAINT CK_Answers_Text CHECK (Text!=''),
	);
END;


IF NOT EXISTS (
	SELECT *
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_NAME = 'AnswersLikes'
	AND TABLE_SCHEMA='dbo')
BEGIN
	CREATE TABLE AnswersLikes(
		UserId NVARCHAR(20) NOT NULL REFERENCES ProgramUsers (Id),
		AnswerId NVARCHAR(20) NOT NULL REFERENCES Answers (Id),
	);
END;




