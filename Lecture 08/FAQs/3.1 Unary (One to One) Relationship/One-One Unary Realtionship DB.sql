create database can_be_deleted;
use can_be_deleted;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    MentorID INT UNIQUE, -- Ensures one-to-one relationship
    FOREIGN KEY (MentorID) REFERENCES Employee(EmployeeID)
);


INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (1, 'Alice', NULL); -- Alice has no mentor

INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (2, 'Bob', 1); -- Bob is mentored by Alice

INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (3, 'Charlie', 2); -- Charlie is mentored by Bob

INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (4, 'David', 3); -- David is mentored by Charlie


SELECT 
    e1.EmployeeName AS Employee, 
    e2.EmployeeName 
    AS Mentor
FROM 
    Employee e1
LEFT JOIN 
    Employee e2 ON e1.MentorID = e2.EmployeeID;
