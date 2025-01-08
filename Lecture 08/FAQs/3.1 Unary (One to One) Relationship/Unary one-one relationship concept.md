### **Unary Relationship (One-to-One) with SQL Commands**

A **one-to-one** unary relationship occurs when a single entity instance is associated with only one other instance of the same entity. This means one row in the table can be related to only one other row in the same table.

---

#### **Example: Employee Mentorship**

In a company, each employee can have **one mentor**, and each mentor can mentor **one mentee**.

---

### **Table Structure**

**Entity:** Employee  
**Attributes:**  
- `EmployeeID` (Primary Key)  
- `EmployeeName`  
- `MentorID` (Foreign Key referencing `EmployeeID`)

---

### **SQL to Create the Table**

```sql
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    MentorID INT UNIQUE, -- Ensures one-to-one relationship
    FOREIGN KEY (MentorID) REFERENCES Employee(EmployeeID)
);
```

- `MentorID` is a foreign key referencing `EmployeeID` in the same table.
- The `UNIQUE` constraint ensures that no mentor is assigned to more than one employee, enforcing the one-to-one relationship.

---

### **Inserting Data**

Insert employees and their mentor relationships:

```sql
INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (1, 'Alice', NULL); -- Alice has no mentor

INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (2, 'Bob', 1); -- Bob is mentored by Alice

INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (3, 'Charlie', 2); -- Charlie is mentored by Bob

INSERT INTO Employee (EmployeeID, EmployeeName, MentorID)
VALUES (4, 'David', 3); -- David is mentored by Charlie
```

---

### **Querying Data**

#### **1. Retrieve all employees and their mentors**

```sql
SELECT 
    e1.EmployeeName AS Employee, 
    e2.EmployeeName AS Mentor
FROM 
    Employee e1
LEFT JOIN 
    Employee e2 ON e1.MentorID = e2.EmployeeID;
```

**Result:**
| **Employee** | **Mentor** |
|--------------|------------|
| Alice        | NULL       |
| Bob          | Alice      |
| Charlie      | Bob        |
| David        | Charlie    |

---

#### **2. Find an employee's mentee**

To find who Alice mentors:

```sql
SELECT EmployeeName
FROM Employee
WHERE MentorID = 1; -- Alice's EmployeeID
```

**Result:**
| **EmployeeName** |
|------------------|
| Bob              |

---

#### **3. Validate One-to-One Relationship**

Ensure no mentor has multiple mentees:

```sql
SELECT MentorID, COUNT(*)
FROM Employee
WHERE MentorID IS NOT NULL
GROUP BY MentorID
HAVING COUNT(*) > 1;
```

If the query returns no rows, the one-to-one constraint is upheld.

---

### **Key Points**

- **MentorID** acts as a self-referencing foreign key with a `UNIQUE` constraint to enforce one-to-one.
- Helps in scenarios like mentorship, spousal relationships, or any 1-to-1 mappings.
- Use SQL queries to navigate relationships and maintain data integrity.

Would you like additional diagrams or queries for this explanation? 😊