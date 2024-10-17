CREATE DATABASE ABC;
USE ABC;

-- Table First Department

CREATE TABLE First_Department (
    empid INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
);


INSERT INTO First_Department (empid, name, role) VALUES
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

SELECT * FROM First_Department;

-- Table Second Table

CREATE TABLE Second_Department (
    empid INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
);

INSERT INTO Second_Department (empid, name, role) VALUES
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');

SELECT * FROM Second_Department;

-- Practise


-- List out all the employees in the company
-- Duplicate values will be removed.
SELECT * FROM first_department
UNION
SELECT * FROM second_department;

-- List out all the emloyees in the company that works as the salesman.
SELECT * FROM first_department
WHERE role="salesman"
UNION
SELECT * FROM second_department
WHERE role="salesman";

-- List out all the employees that work in both the departments.
-- We can't directly apply the inersection as like union. We will have to emulate it.
SELECT * FROM first_department
INNER JOIN
second_department
USING(empid);

-- List out all those employees working in dept1, but not in dept2.
SELECT * FROM first_department
LEFT JOIN
second_department
USING(empid)
WHERE second_department.empid is null;






