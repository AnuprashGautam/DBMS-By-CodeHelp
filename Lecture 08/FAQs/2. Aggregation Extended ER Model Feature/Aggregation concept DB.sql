use can_be_deleted;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);


ALTER TABLE Enrollment
ADD DepartmentID INT NOT NULL,
ADD FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);


INSERT INTO Department VALUES (1, 'Mathematics Department');
INSERT INTO Department VALUES (2, 'Physics Department');


-- Add enrollment records with department responsibility
INSERT INTO Enrollment VALUES (1, 101, 1001, '2025-01-07', 'A', 1);
INSERT INTO Enrollment VALUES (2, 102, 1002, '2025-01-07', 'B', 2);

