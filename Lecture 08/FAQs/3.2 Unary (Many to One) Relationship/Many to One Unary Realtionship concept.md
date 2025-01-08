### **Unary Relationship (One-to-Many) with SQL Commands**

A **one-to-many** unary relationship occurs when a single entity instance is associated with multiple instances of the same entity. This means one row in the table can relate to multiple other rows in the same table.

---

#### **Example: Employee Supervision**

In an organization, one employee (e.g., a manager) can supervise multiple employees, but each employee reports to only one supervisor.

---

### **Table Structure**

**Entity:** Employee  
**Attributes:**  
- `EmployeeID` (Primary Key)  
- `EmployeeName`  
- `SupervisorID` (Foreign Key referencing `EmployeeID`)

---

### **SQL to Create the Table**

```sql
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    SupervisorID INT, -- Supervisor for the employee
    FOREIGN KEY (SupervisorID) REFERENCES Employee(EmployeeID)
);
```

- `SupervisorID` is a foreign key referencing `EmployeeID` in the same table.

---

### **Inserting Data**

Insert employees and their supervisors:

```sql
INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (1, 'Alice', NULL); -- Alice is the top-level manager with no supervisor

INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (2, 'Bob', 1); -- Bob is supervised by Alice

INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (3, 'Charlie', 1); -- Charlie is supervised by Alice

INSERT INTO Employee (EmployeeID, EmployeeName, SupervisorID)
VALUES (4, 'David', 2); -- David is supervised by Bob
```

---

### **Querying Data**

#### **1. Retrieve all employees and their supervisors**

```sql
SELECT 
    e1.EmployeeName AS Employee, 
    e2.EmployeeName AS Supervisor
FROM 
    Employee e1
LEFT JOIN 
    Employee e2 ON e1.SupervisorID = e2.EmployeeID;
```

**Result:**
| **Employee** | **Supervisor** |
|--------------|----------------|
| Alice        | NULL           |
| Bob          | Alice          |
| Charlie      | Alice          |
| David        | Bob            |

---

#### **2. Find employees supervised by a specific supervisor**

To find all employees supervised by Alice:

```sql
SELECT EmployeeName
FROM Employee
WHERE SupervisorID = 1; -- Alice's EmployeeID
```

**Result:**
| **EmployeeName** |
|------------------|
| Bob              |
| Charlie          |

---

#### **3. Find the hierarchy level**

To determine employees at the top level (no supervisor):

```sql
SELECT EmployeeName
FROM Employee
WHERE SupervisorID IS NULL;
```

**Result:**
| **EmployeeName** |
|------------------|
| Alice            |

---

#### **4. Retrieve the full hierarchy**

Use a recursive common table expression (CTE) to retrieve the hierarchy:

```sql
WITH EmployeeHierarchy AS (
    SELECT 
        EmployeeID, 
        EmployeeName, 
        SupervisorID
    FROM Employee
    WHERE SupervisorID IS NULL -- Start with top-level employees
    UNION ALL
    SELECT 
        e.EmployeeID, 
        e.EmployeeName, 
        e.SupervisorID
    FROM Employee e
    INNER JOIN EmployeeHierarchy eh ON e.SupervisorID = eh.EmployeeID
)
SELECT * FROM EmployeeHierarchy;
```

---

### **Key Points**

- **SupervisorID** creates the self-referencing one-to-many relationship.
- Useful for hierarchies like organization charts, product categories, or folder structures.
- Queries allow you to navigate levels and relationships efficiently.

Would you like a diagram to visualize this structure? 😊