Here’s a single **Books** table with dummy data to practice queries. It includes a variety of fields to allow for diverse query scenarios.

---

### **Books Table**

#### **SQL to Create the Table**

```sql
CREATE TABLE Books (
    BookID INT PRIMARY KEY,          -- Unique identifier for each book
    Title VARCHAR(100),              -- Title of the book
    Author VARCHAR(50),              -- Author of the book
    Genre VARCHAR(30),               -- Genre of the book
    PublicationYear INT,             -- Year of publication
    CopiesAvailable INT              -- Number of available copies
);
```

---

#### **Insert Dummy Data**

```sql
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
```

---

### **Example Queries for Practice**

1. **Retrieve all books published before 1950:**

```sql
SELECT * 
FROM Books
WHERE PublicationYear < 1950;
```

---

2. **Find all books with more than 3 copies available:**

```sql
SELECT Title, Author, CopiesAvailable
FROM Books
WHERE CopiesAvailable > 3;
```

---

3. **List books grouped by genre with the total number of available copies for each genre:**

```sql
SELECT Genre, SUM(CopiesAvailable) AS TotalCopies
FROM Books
GROUP BY Genre;
```

---

4. **Get the details of books written by 'George Orwell':**

```sql
SELECT * 
FROM Books
WHERE Author = 'George Orwell';
```

---

5. **Find the newest book in the library:**

```sql
SELECT Title, Author, PublicationYear
FROM Books
ORDER BY PublicationYear DESC
LIMIT 1;
```

This table is ready for you to start practicing! Let me know if you'd like to add more fields or complex queries. 😊