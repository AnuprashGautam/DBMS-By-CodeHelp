create database can_be_deleted;
use can_be_deleted;


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    SupervisorID INT, -- Supervisor for the employee
    FOREIGN KEY (SupervisorID) REFERENCES Employee(EmployeeID)
);


INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (1, 'Alice', NULL); -- Alice is the top-level manager with no supervisor

INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (2, 'Bob', 1); -- Bob is supervised by Alice

INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (3, 'Charlie', 1); -- Charlie is supervised by Alice

INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (4, 'David', 2); -- David is supervised by Bob


SELECT 
    e1.EmployeeName AS Employee, 
    e2.EmployeeName AS Supervisor
FROM 
    Employee e1
LEFT JOIN 
    Employee e2 ON e1.SupervisorID = e2.EmployeeID;
