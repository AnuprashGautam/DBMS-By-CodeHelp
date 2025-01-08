

### Unary Relationship in Database Design

A **unary relationship** is a type of relationship in which an entity is related to itself. This means that instances of the same entity type can have a relationship with each other. It is also referred to as a **recursive relationship**.

---

#### Real-World Example: Employee Supervision

In an organization, an **Employee** entity can supervise another **Employee**. Here, the **Employee** entity is related to itself because:

1. One employee (e.g., a manager) supervises another employee (e.g., a subordinate).
2. The relationship is between employees.

---

### Structure

**Entity**: Employee  
**Relationship**: Supervises  

**Attributes of Employee**:  
- EmployeeID (Primary Key)  
- EmployeeName  
- SupervisorID (Foreign Key referencing EmployeeID)

---

### Example Data

| **EmployeeID** | **EmployeeName** | **SupervisorID** |
|-----------------|------------------|------------------|
| 1               | Alice            | NULL             |
| 2               | Bob              | 1                |
| 3               | Charlie          | 1                |
| 4               | David            | 2                |

---

### Explanation

1. Alice (EmployeeID = 1) is the top-level manager and does not report to anyone, so her **SupervisorID** is `NULL`.
2. Bob (EmployeeID = 2) is supervised by Alice, so his **SupervisorID** is `1`.
3. Charlie (EmployeeID = 3) is also supervised by Alice, so his **SupervisorID** is `1`.
4. David (EmployeeID = 4) is supervised by Bob, so his **SupervisorID** is `2`.

---

### Visualization

Here’s how the relationships look in a hierarchical structure:

```
Alice
├── Bob
│   └── David
└── Charlie
```

---

### Use Case in SQL

To find all employees supervised by Alice (EmployeeID = 1):

```sql
SELECT EmployeeName
FROM Employee
WHERE SupervisorID = 1;
```

**Result:**
- Bob
- Charlie

---

### Key Takeaways

- **Unary relationships** are commonly used for hierarchies (e.g., employees, folder structures).
- They involve self-referencing foreign keys.
- Useful in representing real-world scenarios like supervision, organizational hierarchy, and family trees.

Would you like to add a diagram for this concept? 😊