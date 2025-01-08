### **What is a Subquery?**
A **subquery** is a SQL query **nested inside another query**. It can be placed inside the **SELECT**, **FROM**, **WHERE**, or **HAVING** clause of a SQL statement. The subquery returns a value (or a set of values) that can be used by the outer query to filter or process data.

Subqueries are useful when you need to perform a query that depends on the result of another query, often in a **dynamic** manner.

---

### **Types of Subqueries:**
There are mainly two types of subqueries:

1. **Single-row subquery**
2. **Multi-row subquery**
   
Additionally, subqueries can also be categorized based on where they are used:
- **Scalar subquery** (returns a single value)
- **Correlated subquery** (references columns from the outer query)
- **Non-correlated subquery** (does not reference the outer query)

---

### **1. Single-Row Subquery**
A **single-row subquery** returns exactly one row and one column, which is often used in a **WHERE** or **HAVING** clause to filter data based on a specific value.

#### **Syntax**:
```sql
SELECT column1, column2
FROM table
WHERE column1 = (SELECT column1 FROM table WHERE condition);
```

#### **Example**:
Let’s assume we have two tables:

- **Employees**:
  | EmployeeID | Name    | DepartmentID |
  |------------|---------|--------------|
  | 1          | Alice   | 101          |
  | 2          | Bob     | 102          |
  | 3          | Charlie | 101          |

- **Departments**:
  | DepartmentID | DepartmentName |
  |--------------|----------------|
  | 101          | HR             |
  | 102          | IT             |

```sql
SELECT Name
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR');
```

**Result**:
| Name    |
|---------|
| Alice   |
| Charlie |

Explanation: The inner subquery `(SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR')` returns the DepartmentID `101`. The outer query then retrieves employees who are in the `HR` department.

---

### **2. Multi-Row Subquery**
A **multi-row subquery** returns multiple rows and can be used with operators like `IN`, `ANY`, `ALL`, or `EXISTS`.

#### **Syntax**:
```sql
SELECT column1, column2
FROM table
WHERE column1 IN (SELECT column1 FROM table WHERE condition);
```

#### **Example**:
Using the **Employees** and **Departments** tables again, suppose you want to retrieve employees who are in **either** the **HR** or **IT** department.

```sql
SELECT Name
FROM Employees
WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName IN ('HR', 'IT'));
```

**Result**:
| Name    |
|---------|
| Alice   |
| Bob     |
| Charlie |

Explanation: The subquery returns `101` and `102` (the DepartmentIDs for HR and IT), and the outer query fetches employees from those departments.

---

### **3. Scalar Subquery**
A **scalar subquery** is a subquery that returns a single value (one row and one column), typically used in a `SELECT` or `WHERE` clause.

#### **Syntax**:
```sql
SELECT column1, (SELECT column2 FROM table WHERE condition) AS alias
FROM table;
```

#### **Example**:
Let’s assume we want to fetch the **highest salary** from the `Employees` table for a specific department:

```sql
SELECT Name, (SELECT MAX(Salary) FROM Employees WHERE DepartmentID = 101) AS MaxSalary
FROM Employees;
```

**Result**:
| Name    | MaxSalary |
|---------|-----------|
| Alice   | 5000      |
| Bob     | 4500      |
| Charlie | 5000      |

Explanation: The subquery `(SELECT MAX(Salary) FROM Employees WHERE DepartmentID = 101)` returns the maximum salary in the `HR` department, and this value is used for every row in the outer query.

---

### **4. Correlated Subquery**
A **correlated subquery** refers to the outer query, meaning it **uses values from the outer query** for its processing. It is executed once for each row processed by the outer query.

#### **Syntax**:
```sql
SELECT column1
FROM table1 outer_table
WHERE column1 = (SELECT column2
                 FROM table2 inner_table
                 WHERE outer_table.column1 = inner_table.column2);
```

#### **Example**:
Using the **Employees** and **Departments** tables again, if you want to find employees whose salary is greater than the average salary of their own department:

```sql
SELECT Name
FROM Employees outer_emp
WHERE Salary > (SELECT AVG(Salary) FROM Employees inner_emp WHERE outer_emp.DepartmentID = inner_emp.DepartmentID);
```

**Result**:
| Name    |
|---------|
| Alice   |

Explanation: The subquery calculates the average salary for the department of the current employee. The outer query then returns employees who earn more than the average salary of their department.

---

### **5. Non-Correlated Subquery**
A **non-correlated subquery** is independent of the outer query. It can be executed on its own and does not refer to any columns from the outer query.

#### **Example**:
We want to find all employees who earn more than the average salary across the entire company:

```sql
SELECT Name
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
```

**Result**:
| Name    |
|---------|
| Alice   |

Explanation: The subquery `(SELECT AVG(Salary) FROM Employees)` returns the overall average salary, and the outer query retrieves employees earning more than that average.

---

### **Ways to Write Subqueries**

1. **In the SELECT Clause**: A subquery can return a value for each row selected by the outer query.

   ```sql
   SELECT Name, (SELECT MAX(Salary) FROM Employees) AS MaxSalary
   FROM Employees;
   ```

2. **In the WHERE Clause**: A subquery can filter the rows based on values from the outer query, especially using operators like `IN`, `EXISTS`, `ANY`, `ALL`.

   ```sql
   SELECT Name
   FROM Employees
   WHERE DepartmentID IN (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR');
   ```

3. **In the FROM Clause**: A subquery can be used to create a temporary table or view for the outer query to join with.

   ```sql
   SELECT temp.Name, temp.Salary
   FROM (SELECT Name, Salary FROM Employees WHERE DepartmentID = 101) AS temp;
   ```

---

### **Subquery Restrictions**
1. **Performance**: Correlated subqueries can be slower because they are executed once for each row in the outer query.
2. **Multiple Rows**: Some subqueries can return multiple rows, so they must be used with operators like `IN`, `ANY`, or `EXISTS` to handle multiple results.
3. **Nested Subqueries**: Subqueries can be nested (a subquery inside a subquery), but deep nesting can impact readability and performance.

---

### **Summary of Subqueries:**
- **Single-row subquery**: Returns a single value, typically used with `=` or other comparison operators.
- **Multi-row subquery**: Returns multiple rows and can be used with `IN`, `ANY`, `ALL`.
- **Scalar subquery**: A subquery that returns a single value, often used in the `SELECT` clause.
- **Correlated subquery**: A subquery that depends on the outer query and is executed for each row.
- **Non-correlated subquery**: A subquery that is independent and can be executed on its own.

---

Would you like more examples or further clarification on any of these? 😊