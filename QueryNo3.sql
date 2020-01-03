SELECT ProgramUsers.Id AS UserId, ProgramUsers.FirstName, ProgramUsers.LastName,  COUNT(
CASE
    WHEN Questions.IsClosed =1 THEN 1
    ELSE NULL
END
) AS ClosedQuestions
FROM ProgramUsers
JOIN Questions ON Questions.UserId= ProgramUsers.Id
GROUP BY ProgramUsers.Id, ProgramUsers.FirstName, ProgramUsers.LastName
ORDER BY ClosedQuestions DESC