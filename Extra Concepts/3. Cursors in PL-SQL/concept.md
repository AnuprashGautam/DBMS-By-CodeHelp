Visit this video link: https://www.youtube.com/watch?v=2ege5FiH6Go


---


### What is a Cursor in SQL?

A **Cursor** in SQL is a database object used to retrieve, manipulate, and traverse rows of a result set returned by a query. Cursors allow you to process each row individually rather than processing the entire result set in a single operation. They are mainly used when operations need to be performed on a row-by-row basis, like when dealing with complex logic or calculations that cannot be done in a single SQL query.

### Key Points About Cursors:
- Cursors are generally used when SQL operations need to be applied to individual rows of a query result.
- They allow for more fine-grained control over how rows are processed.
- Cursors can be either **implicit** or **explicit** depending on how they are defined and used in the code.

### Cursor Lifecycle:
1. **Declaration**: Define the cursor and specify the SQL query that will be used to fetch rows.
2. **Opening**: Execute the query and make the result set available for fetching.
3. **Fetching**: Retrieve a row from the result set.
4. **Processing**: Perform operations on the fetched row.
5. **Closing**: Close the cursor to release the resources once all rows are processed.

### Types of Cursors:
There are two main types of cursors in SQL: **Implicit Cursors** and **Explicit Cursors**.

---

### 1. **Implicit Cursor**:
An **Implicit Cursor** is automatically created by the database system when an SQL query is executed. These cursors are managed automatically by SQL without requiring explicit cursor declarations or commands.

- Implicit cursors are used by default in SQL operations such as `INSERT`, `UPDATE`, `DELETE`, and `SELECT` queries.
- The database automatically opens the cursor, fetches the rows, processes them, and closes the cursor once the operation is complete.
  
#### Characteristics:
- Automatically created by the database system.
- Managed by the system, no need for explicit handling.
- Used for single SQL operations.
  
#### Example:
```sql
-- Implicit cursor is automatically used for SELECT query
SELECT * FROM Employees WHERE Department = 'Sales';
```
In this case, the database automatically creates an implicit cursor to process the query and return the result set.

#### Limitations:
- You don’t have full control over the cursor behavior.
- Cannot be used for complex row-by-row processing that requires logic beyond the simple operations like `INSERT`, `UPDATE`, `DELETE`, and `SELECT`.

---

### 2. **Explicit Cursor**:
An **Explicit Cursor** is explicitly defined by the programmer and provides more control over the row-by-row processing of SQL queries. It is typically used when you need to process a result set manually with complex logic (such as fetching a row, processing it, and then fetching the next one).

To use an explicit cursor, you need to explicitly declare it, open it, fetch the rows, and close it once you're done.

#### Characteristics:
- Explicitly declared and controlled by the programmer.
- Provides greater control over the cursor behavior, like fetching specific rows, moving through the result set, and closing the cursor.
- Useful for operations that involve complex logic and multiple steps.
  
#### Syntax for Explicit Cursor:
1. **Declare the cursor**:
   ```sql
   DECLARE cursor_name CURSOR FOR
   SELECT column1, column2
   FROM Employees
   WHERE Department = 'Sales';
   ```

2. **Open the cursor**:
   ```sql
   OPEN cursor_name;
   ```

3. **Fetch rows from the cursor**:
   ```sql
   FETCH NEXT FROM cursor_name INTO @variable1, @variable2;
   ```

4. **Process the rows**: This would typically be inside a loop, where each row is processed.

5. **Close the cursor**:
   ```sql
   CLOSE cursor_name;
   ```

6. **Deallocate the cursor**: This releases the resources.
   ```sql
   DEALLOCATE cursor_name;
   ```

#### Example of Using an Explicit Cursor:
```sql
DECLARE @EmployeeName VARCHAR(50);
DECLARE @EmployeeSalary INT;

DECLARE EmployeeCursor CURSOR FOR
SELECT EmployeeName, Salary
FROM Employees
WHERE Department = 'Sales';

OPEN EmployeeCursor;

FETCH NEXT FROM EmployeeCursor INTO @EmployeeName, @EmployeeSalary;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process the row (e.g., print employee name and salary)
    PRINT 'Employee: ' + @EmployeeName + ', Salary: ' + CAST(@EmployeeSalary AS VARCHAR);

    -- Fetch the next row
    FETCH NEXT FROM EmployeeCursor INTO @EmployeeName, @EmployeeSalary;
END

-- Close and deallocate the cursor
CLOSE EmployeeCursor;
DEALLOCATE EmployeeCursor;
```

#### Advantages:
- More flexibility and control over the result set processing.
- Useful for row-by-row operations, like updating each row in a result set or performing calculations.

#### Limitations:
- Requires manual management of the cursor (open, fetch, close, deallocate).
- Can be slower than set-based operations because of the overhead of fetching and processing rows one at a time.

---

### Difference Between Implicit and Explicit Cursors:

| Aspect                | Implicit Cursor                                | Explicit Cursor                             |
|-----------------------|------------------------------------------------|---------------------------------------------|
| **Creation**          | Automatically created by the database system.  | Explicitly declared and controlled by the user. |
| **Control**           | Less control over behavior (automatic).       | Full control over the behavior of the cursor. |
| **Usage**             | Used for simple SQL operations (SELECT, INSERT, UPDATE, DELETE). | Used for complex row-by-row processing where logic is needed. |
| **Performance**       | More efficient for simple operations.          | Slower due to row-by-row processing overhead. |
| **Resource Management**| Managed automatically by the system.         | Must be manually opened, fetched, and closed. |
| **Use Case**          | Suitable for single-row or simple result set queries. | Suitable for multi-row result sets where complex processing is required. |

---

### Conclusion:

- **Implicit cursors** are automatically handled by the system for simple SQL queries like `INSERT`, `UPDATE`, `DELETE`, and `SELECT`, providing less control but more simplicity.
- **Explicit cursors** are manually declared and give the programmer full control over the result set, making them suitable for complex, row-by-row processing tasks. However, they can introduce performance overhead due to the manual handling of each row. 

In general, it's best to use **set-based operations** (using SQL queries that work with entire sets of data) rather than cursors, as cursors tend to be less efficient. Cursors should only be used when necessary for row-by-row processing.