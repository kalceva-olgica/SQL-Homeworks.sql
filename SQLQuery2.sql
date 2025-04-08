USE master
GO

CREATE DATABASE SEDCACADEMYDB
GO

USE SEDCACADEMYDB
GO

CREATE TABLE Students (
	FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(30) NOT NULL,
	DateOfBirth date NOT NULL,
	EnrolledDate date NOT NULL,
	Gender nvarchar(10) NOT NULL,
	NationalIDNumber nvarchar(20) NOT NULL, 
	StudentCardNumber nvarchar NOT NULL
)
GO	

SELECT * FROM Students

INSERT INTO Students(FirstName,LastName,DateOfBirth,EnrolledDate,Gender,NationalIDNumber,StudentCardNumber)
VALUES('Sofia','Geller','1992-11-03','2025-10-01','F','A123456','1234')
GO

ALTER TABLE Students
ALTER COLUMN NationalIDNumber NVARCHAR(30);
GO

ALTER TABLE STUDENTS
ADD FavoriteSubject nvarchar NULL


CREATE TABLE Teacher(
	Id int NOT NULL,
	FirstName nvarchar NOT NULL,
	LastName nvarchar NOT NULL,
	DateOfBirth date NOT NULL,
	AcademicRank nvarchar(30) NOT NULL,
	HireDate date NOT NULL
)
GO

SELECT * FROM Teacher

INSERT INTO Teacher(Id,FirstName,LastName,DateOfBirth,AcademicRank,HireDate)
VALUES(3,'Marie','Grande','1977-02-14','PhD','2002-12-12')

ALTER TABLE Teacher
ALTER COLUMN FirstName NVARCHAR(30);
GO

ALTER TABLE Teacher
ALTER COLUMN LastName NVARCHAR(30);
GO

CREATE TABLE Grade(
	Id int NOT NULL,
	StudentID nvarchar NOT NULL,
	CourseID nvarchar NOT NULL,
	TeacherID nvarchar NOT NULL,
	Grade nvarchar NOT NULL,
	Comment nvarchar NOT NULL,
	CreatedDate date NOT NULL
) 
GO

SELECT * FROM Grade

INSERT INTO Grade(Id,StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate)
VALUES(8,'17082','839','1057','A','No Comment','2012-11-11')

ALTER TABLE Grade
ALTER COLUMN Comment NVARCHAR(30);
GO


CREATE TABLE Courses(
	Id int NOT NULL,
	Name nvarchar NOT NULL,
	Credit int NOT NULL,
	AcademicYear nvarchar(30) NOT NULL,
	Semester nvarchar(30) NOT NULL
)
GO

SELECT * FROM Courses

INSERT INTO Courses(Id,Name,Credit,AcademicYear,Semester)
VALUES(10,'Computer Science',3,'2021,2022','Spring')

ALTER TABLE Courses
ALTER COLUMN Name NVARCHAR(30);
GO


CREATE TABLE AchievementTypes(
	Id int NOT NULL,
	GradeID int NOT NULL,
	AchievementTypeID int NOT NULL,
	AchievementPoints int NOT NULL,
	AchievementMaxPoints int NOT NULL,
	AchievementDate date NOT NULL
)
GO

SELECT * FROM AchievementTypes

INSERT INTO AchievementTypes(Id,GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate)
VALUES(1, 101, 5, 85, 100, '2025-04-08');


CREATE TABLE GradeDetails(
	Id int NOT NULL,
	Name nvarchar(30) NOT NULL,
	Description nvarchar NOT NULL,
	ParticipationRate decimal NOT NULL
)
GO

SELECT * FROM GradeDetails

INSERT INTO GradeDetails(Id,Name,Description,ParticipationRate)
VALUES(55,'B','Very Good', 85.00)

ALTER TABLE GradeDetails
ALTER COLUMN Description NVARCHAR(50);
GO