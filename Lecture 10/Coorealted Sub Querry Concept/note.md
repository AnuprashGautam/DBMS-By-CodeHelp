### Finding the 3rd Highest Salary Using a Correlated Subquery

This README will guide you step by step through finding the **3rd highest salary** in a table using a **correlated subquery**, without using the `LIMIT` clause.

---

### Step 1: Create the Employees Table

We begin by creating a simple table called `Employees` that has two columns: `ID` and `Salary`.

```sql
CREATE TABLE Employees (
    ID INT,
    Salary INT
);

INSERT INTO Employees (ID, Salary) VALUES
    (1, 3000),
    (2, 2000),
    (3, 4000),
    (4, 1000),
    (5, 5000),
    (6, 3500);
```

After inserting the values, the `Employees` table looks like this:

| ID  | Salary |
| --- | ------ |
| 1   | 3000   |
| 2   | 2000   |
| 3   | 4000   |
| 4   | 1000   |
| 5   | 5000   |
| 6   | 3500   |

---

### Step 2: Problem Statement

We need to find the **3rd highest salary** in the `Employees` table without using `LIMIT`.

---

### Step 3: The Query

We can solve this problem using a **correlated subquery**, which is a subquery that references columns from the outer query. Here’s the SQL query to find the 3rd highest salary:

```sql
SELECT Salary
FROM Employees E1
WHERE 2 = (
    SELECT COUNT(DISTINCT Salary)
    FROM Employees E2
    WHERE E2.Salary > E1.Salary
);
```

---

### Step 4: How the Query Works

Let’s break down how this query works:

#### 1. Outer Query

```sql
SELECT Salary
FROM Employees E1
```
This selects the `Salary` from the `Employees` table and assigns it the alias `E1`.

#### 2. Inner (Correlated) Subquery

```sql
SELECT COUNT(DISTINCT Salary)
FROM Employees E2
WHERE E2.Salary > E1.Salary
```

- This part counts how many **distinct** salaries in the `Employees` table (`E2`) are greater than the current salary from `E1`.
- For each salary in the outer query (`E1.Salary`), this subquery runs and checks how many salaries are greater.

#### 3. Condition

```sql
WHERE 2 = (subquery)
```

- The condition is that we want the **3rd highest salary**, so the number of salaries greater than the current one should be exactly 2. This is because if 2 salaries are greater, then the current salary is the 3rd highest.

---

### Step 5: Explanation with an Example

Let’s evaluate how the query runs for each salary in the table:

1. **For `Salary = 3000`:**
   - Subquery checks: How many salaries are greater than 3000?
   - Salaries greater than 3000: `3500`, `4000`, `5000`
   - Count: 3
   - Since 3 is not equal to 2, this salary is **not** the 3rd highest.

2. **For `Salary = 2000`:**
   - Subquery checks: How many salaries are greater than 2000?
   - Salaries greater than 2000: `3000`, `3500`, `4000`, `5000`
   - Count: 4
   - Since 4 is not equal to 2, this salary is **not** the 3rd highest.

3. **For `Salary = 4000`:**
   - Subquery checks: How many salaries are greater than 4000?
   - Salaries greater than 4000: `5000`
   - Count: 1
   - Since 1 is not equal to 2, this salary is **not** the 3rd highest.

4. **For `Salary = 1000`:**
   - Subquery checks: How many salaries are greater than 1000?
   - Salaries greater than 1000: `2000`, `3000`, `3500`, `4000`, `5000`
   - Count: 5
   - Since 5 is not equal to 2, this salary is **not** the 3rd highest.

5. **For `Salary = 5000`:**
   - Subquery checks: How many salaries are greater than 5000?
   - Salaries greater than 5000: None
   - Count: 0
   - Since 0 is not equal to 2, this salary is **not** the 3rd highest.

6. **For `Salary = 3500`:**
   - Subquery checks: How many salaries are greater than 3500?
   - Salaries greater than 3500: `4000`, `5000`
   - Count: 2
   - Since 2 **is equal** to 2, this salary **is** the 3rd highest.

---

### Step 6: Final Output

The query will return the following:

| Salary |
| ------ |
| 3500   |

This shows that the **3rd highest salary** is `3500`.

---

### Summary

- The **correlated subquery** compares each salary with others and counts how many are greater.
- We then filter the results to find the salary for which exactly 2 salaries are greater, meaning that the current salary is the **3rd highest**.
