create database can_be_deleted;
use can_be_deleted;


CREATE TABLE Person (
    PersonID INT PRIMARY KEY,         -- Unique identifier for each person
    PersonName VARCHAR(50) NOT NULL   -- Name of the person
);


CREATE TABLE Friendship (
    Person1ID INT,                    -- Person initiating the friendship
    Person2ID INT,                    -- Person being friended
    PRIMARY KEY (Person1ID, Person2ID),
    FOREIGN KEY (Person1ID) REFERENCES Person(PersonID),
    FOREIGN KEY (Person2ID) REFERENCES Person(PersonID)
);


INSERT INTO Person (PersonID, PersonName)
VALUES 
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');


INSERT INTO Friendship (Person1ID, Person2ID)
VALUES 
(1, 2), -- Alice is friends with Bob
(1, 3), -- Alice is friends with Charlie
(2, 3), -- Bob is friends with Charlie
(3, 4); -- Charlie is friends with David
