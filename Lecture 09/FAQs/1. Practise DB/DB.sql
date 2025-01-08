create database lib;
use lib;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,          -- Unique identifier for each book
    Title VARCHAR(100),              -- Title of the book
    Author VARCHAR(50),              -- Author of the book
    Genre VARCHAR(30),               -- Genre of the book
    PublicationYear INT,             -- Year of publication
    CopiesAvailable INT              -- Number of available copies
);

INSERT INTO Books (BookID, Title, Author, Genre, PublicationYear, CopiesAvailable)
VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
(3, '1984', 'George Orwell', 'Dystopian', 1949, 4),
(4, 'Moby Dick', 'Herman Melville', 'Adventure', 1851, 2),
(5, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 6),
(6, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 4),
(7, 'Brave New World', 'Aldous Huxley', 'Dystopian', 1932, 3),
(8, 'The Odyssey', 'Homer', 'Epic', -800, 2),
(9, 'War and Peace', 'Leo Tolstoy', 'Historical', 1869, 1),
(10, 'Jane Eyre', 'Charlotte Brontë', 'Romance', 1847, 4);


select * from Books where PublicationYear < 1950;


select * from Books where CopiesAvailable > 3;


select * from Books where CopiesAvailable > 3;

select Genre, SUM(CopiesAvailable) as TotalCopies
from Books group by Genre;


select * from Books order by PublicationYear desc limit 1;

