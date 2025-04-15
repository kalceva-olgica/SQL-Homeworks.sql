USE SEDC_ACADEMY_HOMEWORK
GO

-- Calculate the count of all grades per Teacher in the system
SELECT t.FirstName AS Teacher, COUNT(g.ID) AS GradeCount FROM Teacher t
JOIN Grade g ON t.ID = g.TeacherID
GROUP BY t.FirstName;
GO

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.ID, t.FirstName AS TeacherName, COUNT(g.ID) AS GradeCount
FROM Teacher t
JOIN Grade g ON t.ID = g.TeacherID
JOIN Student s ON g.StudentID = s.ID
WHERE s.ID < 100
GROUP BY t.ID, t.FirstName;
GO

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT g.StudentID, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGrade
FROM Grade g
GROUP BY g.StudentID;
GO

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName AS Teacher, COUNT(g.ID) AS GradeCount 
FROM Teacher t
JOIN Grade g ON t.ID = g.TeacherID
GROUP BY t.FirstName
HAVING COUNT(g.ID) > 200
GO

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on
-- all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT g.StudentID, MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGRade
FROM Grade g
GROUP BY g.StudentID
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

-- List Student First Name and Last Name next to the other details from previous query
--SELECT * FROM Student
SELECT g.StudentID, s.FirstName, s.LastName  ,MAX(g.Grade) AS MaxGrade, AVG(g.Grade) AS AvgGRade
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

-- Create new view (vv_StudentGrades) that will List all StudentId's and count of Grades per student
--DROP VIEW vv_StudentGrades
SELECT * FROM Grade g
CREATE VIEW vv_StudentGrades -- ne znam zosto e potcrteno so crveno a mi raboti kako sto treba
AS
SELECT
g.StudentID,
g.Grade
FROM Grade g
GO

SELECT * FROM vv_StudentGrades

-- Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades
AS
SELECT
s.FirstName,
s.LastName,
g.Grade
FROM 
Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName, g.Grade

-- List all rows from view ordered by biggest Grade Count
SELECT *
FROM vv_StudentGrades 
ORDER BY vv_StudentGrades.Grade DESC
