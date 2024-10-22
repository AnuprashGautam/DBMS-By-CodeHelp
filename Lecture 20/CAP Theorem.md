The **CAP theorem** in DBMS (Database Management Systems) states that a distributed database can only achieve **two out of three** of the following properties at the same time:

1. **Consistency (C)**: Every read receives the most recent write. In other words, all nodes show the same data at any given time.
   - Example: In a banking system, if you deposit money at one branch, it immediately reflects across all branches.

2. **Availability (A)**: Every request receives a response, even if some of the data is not up-to-date.
   - Example: Even if some servers are down, you can still access the website, though the data might not be fully up-to-date.

3. **Partition Tolerance (P)**: The system continues to operate, even if there is a network partition (some parts of the network are unreachable).
   - Example: Even if some servers can't communicate with each other due to a network issue, the system still works, though it might not be fully consistent.

### Example:
In a distributed database, you can't have all three properties at the same time. For instance:
- **CA** (Consistency + Availability, no Partition Tolerance): The system will work perfectly, but if there's a network issue, it may stop functioning.
- **AP** (Availability + Partition Tolerance, no Consistency): The system will stay available during network issues, but the data may not be fully up-to-date.
- **CP** (Consistency + Partition Tolerance, no Availability): The system ensures up-to-date data during network issues but might be temporarily unavailable.

Thus, depending on the use case, you have to sacrifice one of these properties in distributed systems.