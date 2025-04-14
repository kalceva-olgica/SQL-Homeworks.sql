USE SEDC_ACADEMY_HOMEWORK
GO

-- find all students with first name "Antonio"
SELECT * FROM Student 
WHERE FirstName = 'Antonio';

-- SELECT FirstName FROM Student  *Moze i vaka so FirstName ni ja vrakja samo kolonata so FirstName
-- WHERE FirstName = 'Antonio'


-- find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student
WHERE DateOfBirth > '01.01.1999';

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM Student
WHERE LastName LIKE 'J%' 
-- AND YEAR(EnrolledDate) = 1998 *Bi napravila vaka no nema ni eden student zapiseno vo january/1998 i ne vrakja nisto, a koristam year i month bidejki ne e specificiran datum
-- AND MONTH(EnrolledDate) = 1;

-- List all Students ordered by FirstName
SELECT s.FirstName FROM Student s
ORDER BY FirstName

-- List all Teacher Last Names and Student Last Names in single result set.
-- Remove duplicates
SELECT DISTINCT LastName
FROM Student
UNION
SELECT DISTINCT  LastName
FROM Teacher

-- Create Foreign key constraints from diagram or with script


--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name, at.Name 
FROM Course c, AchievementType at -- ne sum sigurna dali vaka treba


-- List all Teachers without exam Grade
SELECT t.ID, t.FirstName, t.LastName
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
WHERE g.ID IS NULL;

