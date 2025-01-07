create database can_be_deleted;
use can_be_deleted;


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100)
);


CREATE TABLE Enrollment (
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    InstructorID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Grade CHAR(1),
    PRIMARY KEY (StudentID, CourseID, InstructorID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);


-- Insert sample data into Student
INSERT INTO Student VALUES (1, 'Alice');
INSERT INTO Student VALUES (2, 'Bob');

-- Insert sample data into Course
INSERT INTO Course VALUES (101, 'Mathematics');
INSERT INTO Course VALUES (102, 'Physics');

-- Insert sample data into Instructor
INSERT INTO Instructor VALUES (1001, 'Dr. Smith');
INSERT INTO Instructor VALUES (1002, 'Dr. Johnson');

-- Insert sample data into Enrollment
INSERT INTO Enrollment VALUES (1, 101, 1001, '2025-01-07', 'A');
INSERT INTO Enrollment VALUES (2, 102, 1002, '2025-01-07', 'B');




