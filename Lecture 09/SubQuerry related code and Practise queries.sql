CREATE DATABASE SubQueryDB;
USE SubQueryDB;

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


-- SUB QUERIES 
-- WHERE clause same table 
-- employee with age > 30
SELECT * FROM Employee WHERE age IN ( SELECT age FROM employee WHERE age > 30);


-- WHERE clause different table 
-- emp details working in more than 1 project.
SELECT * FROM Employee WHERE id IN ( SELECT empID FROM project GROUP BY empID HAVING count(empID)>1);


-- Single value Sub query
-- emp details where their age is greater than average age
SELECT * FROM Employee WHERE age > (SELECT AVG(age) FROM Employee);

-- FROM clause - derieved tables
-- select max age of person that contains "a" in its first name
SELECT MAX(age) FROM (SELECT * FROM Employee WHERE fname like "%a%") AS temp;

-- Corelated subquery
-- find 3rd oldest employee
SELECT *
FROM Employee as e1
WHERE 3=(
	SELECT COUNT(e2.age)
    FROM Employee AS e2
    WHERE e2.age >= e1.age
);