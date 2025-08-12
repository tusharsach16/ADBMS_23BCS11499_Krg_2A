
--------------------------- EASY---------------------------
--Author-Book Relationship Using Joins and Basic SQL Operations
--1.	Design two tables one for storing author details and the other for book details.
--2.	Ensure a foreign key relationship from the book to its respective author.
--3.	Insert at least three records in each table.
--4.	Perform an INNER JOIN to link each book with its author using the common author ID.
--5.	Select the book title, author name, and author�s country.


CREATE TABLE AuthorDetails (
	AuthorID INT PRIMARY KEY,
	AuthorName VARCHAR(50),
	Country VARCHAR(50)
);

CREATE TABLE BookDetails (
	BookID INT PRIMARY KEY,
	BookTitle VARCHAR(MAX),
	AuthorID INT,
	FOREIGN KEY (AuthorID) REFERENCES AuthorDetails(AuthorID)
);

INSERT INTO AuthorDetails (AuthorID, AuthorName, Country) VALUES
(1, 'Tushar', 'India'),
(2, 'Anirudh', 'India'),
(3, 'Parth', 'India');

SELECT * FROM AuthorDetails;

INSERT INTO BookDetails (BookID, BookTitle, AuthorID) VALUES
(1, 'Mastering SQL in 30 Days', 1),
(2, 'Data Structures Made Easy', 2),
(3, 'Journey Through AI', 3);

SELECT * FROM BookDetails;

SELECT 
	BD.BookTitle, 
	AD.AuthorName, 
	AD.Country
FROM AuthorDetails AS AD
INNER JOIN BookDetails AS BD
ON AD.AuthorID = BD.AuthorID;



------------------------- MEDIUM ----------------------
--Department-Course Subquery and Access Control
--1. Design normalized tables for departments and the courses they offer, maintaining a foreign key relationship.2. Insert five departments and at least ten courses across those departments.
--3. Use a subquery to count the number of courses under each department.
--4. Filter and retrieve only those departments that offer more than two courses.
--5. Grant SELECT-only access on the courses table to a specific user.

CREATE TABLE Department (
	DeptID INT PRIMARY KEY,
	DeptName VARCHAR(100) NOT NULL
);

CREATE TABLE Course (
	CourseID INT PRIMARY KEY,
	CourseName VARCHAR(150) NOT NULL,
	DeptID INT,
	FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Biology');
SELECT * FROM Department;

INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Algorithms', 1),
(104, 'Calculus I', 2),
(105, 'Linear Algebra', 2),
(106, 'Quantum Mechanics', 3),
(107, 'Classical Mechanics', 3),
(108, 'Modern Poetry', 4),
(109, 'Cell Biology', 5),
(110, 'Genetics', 5);
SELECT * FROM Course;

SELECT DeptName
FROM Department
WHERE DeptID IN (
	SELECT DeptID
	FROM Course
	GROUP BY DeptID
	HAVING COUNT(CourseID) > 2
);
