CREATE DATABASE Company;
USE Company;

-- Table Employee

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(100),
    PhoneNo INT,
    City VARCHAR(50)
);

INSERT INTO Employee (id, fname, lname, Age, emailID, PhoneNo, City) VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');

SELECT * FROM Employee;

-- Table Project

CREATE TABLE Project (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(10),
    startdate DATE,
    clientID INT,
	FOREIGN KEY (empID) REFERENCES Employee(id)
);


INSERT INTO Project (id, empID, name, startdate, clientID) VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);

SELECT * FROM Project;

-- Table Client

CREATE TABLE Client (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo INT,
    City VARCHAR(50),
    empID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id)
);

INSERT INTO Client (id, first_name, last_name, age, emailID, PhoneNo, City, empID) VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', 333, 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', 111, 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', 45454, 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', 77767, 'Mumbai', 2);

SELECT * FROM Client;


-- Practise

SELECT e.fname,e.lname,p.id,p.name FROM Employee AS e
INNER JOIN 
Project AS p
ON 
e.id=p.empID;

SELECT e.fname,e.lname, c.first_name, c.last_name FROM Employee AS e
INNER JOIN 
Client as c
ON
e.id=c.empID
WHERE 
e.City="Jaipur" AND c.City="Hyderabad";

SELECT * FROM Employee 
LEFT JOIN 
Project
ON
Employee.id=Project.empID;

SELECT p.name,e.fname,e.lname,e.emailID FROM Project AS P
INNER JOIN 
Employee AS e
ON
p.empID=e.id;

SELECT Employee.fname,Employee.lname,Project.id, Project.name FROM Employee 
CROSS JOIN 
Project;

