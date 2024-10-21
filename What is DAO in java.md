# What is DAO in java?

The **DAO (Data Access Object)** in Java is a design pattern used to manage the interaction between your application and a database (or any other type of data source). It acts as a bridge between the **business logic** of the application (what the app is supposed to do) and the **database operations** (how data is stored, retrieved, updated, or deleted).

### Think of it like this:
- Imagine you have an app, and this app needs to store data somewhere (like a database).
- You don’t want your main app to worry about how the data is stored, where it’s stored, or how to fetch it. That would make the code messy and hard to manage.
- So, you create a **DAO**, a specific class or set of classes that are responsible for just one thing: **talking to the database**.
- This way, whenever you need to save or get some data, you just call the methods in your DAO, and it will handle all the database details for you.

### Benefits:
1. **Simplifies your code**: You don't need to write database code everywhere in your app. You keep it all in one place (the DAO).
2. **Easier to maintain**: If you ever need to change how you connect to the database, you only need to change it in the DAO, not throughout your app.
3. **Separation of concerns**: Your app focuses on business logic (what it needs to do), and your DAO focuses on database logic (how to store and retrieve data).

### Example of How DAO Works:

#### Without DAO:
```java
// Business logic and database logic mixed
public class EmployeeService {
    public Employee getEmployee(int id) {
        // Database connection code
        // Query code to fetch employee from the database
        // Return employee object
    }
}
```
This mixes the business logic (getting employee details) and the database logic (how to connect and fetch from the database), which can make things confusing.

#### With DAO:
```java
// The DAO that handles only database operations
public class EmployeeDAO {
    public Employee getEmployeeById(int id) {
        // Database connection code
        // Query code to fetch employee from the database
        // Return employee object
    }
}

// The service class focuses only on business logic
public class EmployeeService {
    private EmployeeDAO employeeDAO = new EmployeeDAO();

    public Employee getEmployee(int id) {
        return employeeDAO.getEmployeeById(id);  // Ask DAO to handle the database stuff
    }
}
```

### Key Responsibilities of DAO:
1. **CRUD operations**: Create, Read, Update, Delete – the basic functions of interacting with data.
2. **Data abstraction**: Hides the complexity of database access from the rest of the application.
3. **Reusability**: You can reuse DAO methods across different parts of your app, like `getEmployeeById()`, `saveEmployee()`, etc.

### Conclusion:
The DAO pattern is a clean way to separate your data access logic from your business logic, making your application easier to manage, test, and maintain. It focuses on **one job**: handling communication with the database.