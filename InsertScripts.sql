INSERT INTO WorkPosition (Position)
VALUES 
('Java Developer'),
('Designer'),
('Front-end Developer'),
('Manager')

INSERT INTO ProgramUsers (Id, FirstName, LastName, Email, Password, WorkExperience, WorkPositionId)
VALUES
('1userid', 'Ivan', 'Petrov', 'user1@mail.ru', 'password1', 2, 3),
('2userid', 'Peter', 'Lomov', 'user2@mail.ru', 'password2', null, 1),
('3userid', 'Olga', 'Savina', 'user3@mail.ru', 'password3', 0, 2),
('4userid', 'Irina', 'Kostenko', 'user4@mail.ru', 'password4', 6, 4)

INSERT INTO ProgLanguages (Language)
VALUES
('Java'),
('JS'),
('Python'),
('C#'),
('C++'),
('TS'),
('React')

INSERT INTO UsersProgLanguages (UserId, ProgLanguageId)
VALUES
('1userid', 2),
('1userid', 3),
('1userid', 7),
('2userid',1),
('2userid',4),
('3userid', 2),
('4userid', 3),
('4userid', 6),
('4userid', 5)

INSERT INTO Hashtags (Hashtag)
VALUES
('datpe'),
('defaultvalue'),
('createrequest'),
('filterbydate'),
('boolean'),
('deleteMatches')


INSERT INTO Questions (Id, Title, Description,Date, UserId, IsClosed)
VALUES
('1questionId', 'title of 1st question', 'description question 1', DEFAULT, '1userid', 0),
('2questionId', 'title of 2nd question', 'description question 2', DEFAULT, '2userid', 0),
('3questionId', 'title of 3rd question', 'description question 3',DEFAULT, '2userid', 1),
('4questionId', 'title of 4th question', 'description question 4', DEFAULT,'4userid', 0),
('5questionId', 'title of 5th question', 'description question 5',DEFAULT, '3userid', 1),
('6questionId', 'title of 6 question', 'description question 6', DEFAULT, '3userid', 1)

INSERT INTO QuestionsHashtags (HashtagId, QuestionId)
VALUES
(1, '1questionId'),
(2, '1questionId'),
(4, '2questionId'),
(6, '2questionId'),
(3, '3questionId'),
(5, '4questionId'),
(2, '5questionId'),
(3, '6questionId'),
(5, '1questionId'),
(1, '2questionId')

INSERT INTO Answers (Id, Text, Date, UserId, QuestionId, IsAccepted)
VALUES
('1answerId', 'answer answer answer 1', default, '3userid', '3questionId', 0),
('2answerId', 'answer answer answer 2', default, '2userid', '1questionId', 0),
('3answerId', 'answer answer answer 3', default, '4userid', '2questionId', 0),
('4answerId', 'answer answer answer 4', default, '2userid', '4questionId', 0),
('5answerId', 'answer answer answer 5', default, '3userid', '1questionId', 0),
('6answerId', 'answer answer answer 6', default, '3userid' , '3questionId', 1),
('7answerId', 'answer answer answer 7', default, '1userid', '5questionId', 1),
('8answerId', 'answer answer answer 8', default, '4userid', '6questionId', 1)


INSERT INTO AnswersLikes (UserId, AnswerId)
VALUES
('4userid','1answerId'),
('3userid','2answerId'),
('2userid','3answerId'),
('4userid','4answerId'),
('1userid','5answerId'),
('2userid','6answerId'),
('2userid','7answerId'),
('1userid','1answerId'),
('1userid','2answerId'),
('4userid','2answerId'),
('3userid','4answerId'),
('1userid','6answerId')




















