USE SEDC_ACADEMY_HOMEWORK
GO

DECLARE @FirstName NVARCHAR(20)

SET @FirstName = 'Antonio'


SELECT *
FROM Student
WHERE FirstName = @FirstName;

DECLARE @FemaleStudents TABLE (
    StudentId INT,
    StudentName NVARCHAR(100),
    DateOfBirth DATE
)

INSERT INTO @FemaleStudents (StudentId, StudentName, DateOfBirth)
SELECT ID, CONCAT(FirstName, ' ', LastName), DateOfBirth
FROM Student
WHERE Gender = 'Female';

CREATE TABLE #MaleStudents (
    LastName NVARCHAR(20),
    EnrolledDate DATE
)

INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT 
LastName,
EnrolledDate
FROM Student
WHERE Gender = 'Male' AND FirstName LIKE 'A%'



SELECT *FROM #MaleStudents
WHERE LEN(LastName) = 7

SELECT * FROM Teacher
WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3);
