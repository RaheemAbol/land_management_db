# land_managment_db

---

  - Set up the database using the provided SQL script.
  - [Download landmanagement_database.sql](https://raw.githubusercontent.com/RaheemAbol/land_management_db/main/landmanagment.sql)
  - Ensure that all tables are created, and data is inserted correctly.

### **Ticket Breakdown: Land Management Database Project**


#### **TeamLead:**

1. **Task:** Create a new `TransactionLogs` table for logging actions on land transactions.
   - **Instructions:** 
     - Create a table named `TransactionLogs` to keep track of any actions taken on land transactions.
     - The table should include the following columns:
       - `LogID` (Primary Key, Auto Increment): A unique identifier for each log entry.
       - `TransactionID` (Foreign Key): References the `TransactionID` in the `Transactions` table.
       - `Action` (VARCHAR): The action performed (e.g., 'UPDATE', 'CANCEL').
       - `ActionDate` (TIMESTAMP): Automatically set to the current timestamp when a log entry is created.
       - `PerformedBy` (VARCHAR): The username of the person who performed the action.
     - Ensure that the `TransactionID` is properly referenced from the `Transactions` table with cascading on delete and update.

2. **Task:** Alter the `Transactions` table to add a `Notes` column.
   - **Instructions:**
     - Modify the `Transactions` table to include a `Notes` column.
     - The `Notes` column should be of type `VARCHAR(255)`.
     - This column will be used to store any additional information or comments related to the land transaction.

---

#### **DBEngineer:**

1. **Task:** Insert data into the `TransactionLogs` and `Transactions` tables based on land transactions.
   - **Instructions:**
     - Insert new records into the `TransactionLogs` table to log actions related to existing land transactions.
     - Insert new records into the `Transactions` table, including notes in the newly added `Notes` column.
     - Ensure that these logs reference valid transactions.

2. **Task:** Update the `TransactionStatus` table to include a new status 'In Progress'.
   - **Instructions:**
     - Add a new status called 'In Progress' to the `TransactionStatus` table.
     - Ensure this status can be used to represent land transactions that are not yet completed but are actively being processed.

3. **Task:** Use SQL transactions to ensure that inserts and updates to the land transaction data are atomic and consistent.
   - **Instructions:**
     - Start a SQL transaction to ensure that a series of operations related to land transactions are completed successfully or rolled back in case of an error.
     - Insert a new owner and a new land plot within the transaction.
     - Insert a new transaction record for the land plot sale within the same SQL transaction.
     - Commit the transaction if all operations succeed. Rollback if any operation fails.

---

#### **JavaEngineer:**

1. **Task:** Update the `LandPlots` table to change the ownership of a plot after a sale.
   - **Instructions:**
     - Change the `OwnerID` of a specific land plot in the `LandPlots` table to reflect the new owner.
     - Ensure that the new `OwnerID` exists in the `Owners` table.
     - This task reflects a change in ownership due to a land sale.

2. **Task:** Update a transaction to reflect a status change from 'Pending' to 'In Progress'.
   - **Instructions:**
     - Find a transaction in the `Transactions` table that is currently marked as 'Pending'.
     - Update its `StatusID` to reflect 'In Progress'.
     - Ensure that the `StatusID` correctly references the `TransactionStatus` table.
     - Add a note in the `Notes` column explaining why the status was changed.

3. **Task:** Log the changes made to land transactions.
   - **Instructions:**
     - Every time a land transaction is updated (such as in the previous task), create a new entry in the `TransactionLogs` table.
     - Include the `TransactionID`, the action performed (e.g., 'UPDATE'), and the username of the person making the change.
     - This will help in tracking changes to the land transactions for auditing purposes.

---

#### **JuniorDeveloper:**

1. **Task:** Select all "Commercial" plots larger than 1 acres and count the number of transaction logs associated with each plot.
   - **Instructions:**
     - Write a query to retrieve all plots of land that are classified as "Commercial" and have a size greater than 3 acres.
     - For each plot, count the number of entries in the `TransactionLogs` table related to that plot.
     - The query should return the plot's `Address`, `City`, `State`, `Size`, and the count of transaction logs.

2. **Task:** View all transactions with a 'Completed' status and check if they have any associated logs.
   - **Instructions:**
     - Write a query to retrieve all transactions that have a status of 'Completed'.
     - Use a simple join to check if there are any corresponding entries in the `TransactionLogs` table for these transactions.
     - The query should return the `PlotID`, `SalePrice`, `SaleDate`, and a flag (`Yes` or `No`) indicating whether there is an associated log.

---
