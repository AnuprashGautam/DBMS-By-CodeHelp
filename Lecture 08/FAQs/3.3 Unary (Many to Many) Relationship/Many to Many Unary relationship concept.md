### **Unary Relationship (Many-to-Many) in Databases**

A **many-to-many unary relationship** occurs when multiple instances of an entity can be related to multiple other instances of the same entity. This is a recursive relationship where an entity is associated with itself, and there is no restriction on the number of relationships.

---

### **Example: Friendships in a Social Network**

In a social network, a person can be friends with multiple other people, and each of those people can also be friends with multiple others.  
Here, the entity **Person** has a **many-to-many relationship** with itself.

---

### **Database Design for Many-to-Many Unary Relationship**

To represent this in a relational database, we need:
1. **Main Entity Table**: A table for the `Person` entity.
2. **Join Table**: A table to represent the many-to-many relationship.

---

#### **SQL Table Definitions**

1. **Person Table**: Stores details of each person.

```sql
CREATE TABLE Person (
    PersonID INT PRIMARY KEY,         -- Unique identifier for each person
    PersonName VARCHAR(50) NOT NULL   -- Name of the person
);
```

2. **Friendship Table**: Stores the many-to-many relationships between people.

```sql
CREATE TABLE Friendship (
    Person1ID INT,                    -- Person initiating the friendship
    Person2ID INT,                    -- Person being friended
    PRIMARY KEY (Person1ID, Person2ID),
    FOREIGN KEY (Person1ID) REFERENCES Person(PersonID),
    FOREIGN KEY (Person2ID) REFERENCES Person(PersonID)
);
```

- `Person1ID` and `Person2ID` represent the two people in the relationship.
- The **primary key** ensures that the same friendship cannot be added twice.
- Both `Person1ID` and `Person2ID` are foreign keys referencing `Person`.

---

#### **Inserting Data**

Let's assume we have four people in the `Person` table:

```sql
INSERT INTO Person (PersonID, PersonName)
VALUES 
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');
```

Now, add friendships:

```sql
INSERT INTO Friendship (Person1ID, Person2ID)
VALUES 
(1, 2), -- Alice is friends with Bob
(1, 3), -- Alice is friends with Charlie
(2, 3), -- Bob is friends with Charlie
(3, 4); -- Charlie is friends with David
```

---

#### **Querying the Relationship**

1. **Retrieve All Friendships**:

```sql
SELECT 
    p1.PersonName AS Person, 
    p2.PersonName AS Friend
FROM 
    Friendship f
JOIN 
    Person p1 ON f.Person1ID = p1.PersonID
JOIN 
    Person p2 ON f.Person2ID = p2.PersonID;
```

**Result:**
| **Person** | **Friend** |
|------------|------------|
| Alice      | Bob        |
| Alice      | Charlie    |
| Bob        | Charlie    |
| Charlie    | David      |

---

2. **Find Friends of a Specific Person (e.g., Charlie):**

```sql
SELECT p2.PersonName AS Friend
FROM Friendship f
JOIN Person p2 ON f.Person2ID = p2.PersonID
WHERE f.Person1ID = 3; -- Charlie's PersonID
```

**Result:**
| **Friend** |
|------------|
| David      |

---

#### **Reciprocal Friendships**

If friendships are reciprocal (i.e., if Alice is friends with Bob, then Bob is also friends with Alice), ensure that the `Friendship` table reflects both directions:

```sql
INSERT INTO Friendship (Person1ID, Person2ID) VALUES (2, 1); -- Bob is friends with Alice
```

---

### **Key Points**

- Many-to-many unary relationships require a **join table** to map the relationships.
- The join table contains two foreign keys referencing the same primary key in the main entity table.
- Additional attributes (e.g., friendship date) can be added to the join table to store metadata about the relationship.

Would you like a visual diagram or further details on specific queries? 😊