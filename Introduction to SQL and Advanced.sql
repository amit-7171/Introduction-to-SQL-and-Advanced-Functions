-Question 1 : Explain the fundamental differences between DDL, DML, and DQL commands
in SQL. Provide one example for each type of command.
Answer- The fundamental differences between DDL, DML, and DQL commands in SQL lie
in their primary function and the type of database object they affect.
1. Data Definition Language (DDL)
-- Function: DDL commands are used to define and manage the structure of the
database objects. They deal with the schema, or the blueprint, of the database.
-- Effect: These commands permanently affect the database structure (e.g., tables,
indexes, users). They trigger an implicit COMMIT, meaning the changes cannot be
rolled back.
--Focus: Structure/Schema
-- Example Commands: CREATE, ALTER, DROP, TRUNCATE, RENAME.
2. Data Manipulation Language (DML)
-- Function: DML commands are used to manage and manipulate the data within the
schema objects (like tables). They affect the data stored in the database.
-- Effect: Changes made by DML commands are not permanent until a COMMIT
command is executed (or a transaction ends). They can be undone using a
ROLLBACK command.
-- Focus: Data
-- Example Commands: INSERT, UPDATE, DELETE, MERGE
3. Data Query Language (DQL)
--Function: DQL commands are used to retrieve or fetch data from the database
based on a user's query.
● Effect: DQL commands do not modify the database structure or the data itself; they
simply present the data.
● Focus: Retrieval
● Example Commands: SELECT.
--Question 2 : What is the purpose of SQL constraints? Name and describe three common
types of constraints, providing a simple scenario where each would be useful
Answer- SQL constraints are rules enforced on data columns in a table. Their primary
purpose is to limit the type of data that can be inserted into a table, thereby maintaining
the accuracy, integrity, and reliability of the data in the database.
Three Common Types of Constraints
Here are three common types of SQL constraints:
1. PRIMARY KEY
● Description: A PRIMARY KEY is a column or a set of columns that uniquely
identifies each record (row) in a table. It must contain unique values and cannot
contain NULL values. A table can only have one primary key.
● Scenario: In an Orders table, the OrderID column would be defined as the primary
key. This ensures that every order placed has a unique identifier, preventing
duplicate order records and allowing for efficient retrieval and linking to other tables
(like OrderItems).
2. FOREIGN KEY
● Description: A FOREIGN KEY is a column (or collection of columns) in one table
that refers to the PRIMARY KEY in another table. Its purpose is to establish and
enforce a link between two tables, ensuring referential integrity. It prevents actions
that would destroy those links (e.g., deleting a customer record if there are still orders
associated with that customer).
● Scenario: Consider two tables: Customers (with CustomerID as the primary key)
and Orders. The Orders table would have a CustomerID column defined as a
foreign key that references the Customers table. This ensures that every order
recorded is always associated with a valid, existing customer.
3. NOT NULL
● Description: The NOT NULL constraint simply ensures that a column cannot
contain a NULL value. This means that when a new record is inserted, a value must
be provided for that specific column.
● Scenario: In an Employees table, the LastName column should have a NOT NULL
constraint. This is because a name is essential for identifying an employee, and
allowing it to be empty (NULL) would introduce incomplete and confusing data.
Question 3 : Explain the difference between LIMIT and OFFSET clauses in SQL. How would
you use them together to retrieve the third page of results, assuming each page has 10
records?
Answer- The LIMIT and OFFSET clauses in SQL are primarily used with the SELECT
statement to control which rows are returned from the result set.
1. LIMIT Clause
● Purpose: The LIMIT clause is used to restrict the maximum number of rows that
the query will return. It specifies the "size" of the result set.
● Syntax: LIMIT count
● Example: If a table has 100 rows, SELECT * FROM Products LIMIT 5; will only
return the first 5 rows.
2. OFFSET Clause
● Purpose: The OFFSET clause is used to skip a specified number of rows from the
beginning of the result set before starting to return the rows. It specifies the "starting
point" for the result set.
● Syntax: OFFSET start
● Example: SELECT * FROM Products LIMIT 5 OFFSET 10; will skip the first 10 rows
and then return the next 5 rows.
Retrieving the Third Page of Results (Pagination)
You use both clauses together to implement pagination, allowing you to fetch specific
"pages" of data from a large result set.
To retrieve the third page of results, assuming each page has 10 records:
1. Determine the Page Size (LIMIT): The page size is 10 records.
$$\text{LIMIT} = 10$$
2. Determine the starting row to skip (OFFSET):
You need to skip all the records from the previous pages (Page 1 and Page 2).
○ Records to Skip $= (\text{Page Number} - 1) \times \text{Page Size}$
○ Records to Skip $= (3 - 1) \times 10$
○ Records to Skip $= 2 \times 10 = 20$
3. $$\text{OFFSET} = 20$$
--Question 4 : What is a Common Table Expression (CTE) in SQL, and what are its main
benefits? Provide a simple SQL example demonstrating its usage
Answer- Common Table Expression (CTE) in SQL
A Common Table Expression (CTE) is a temporary, named result set defined within the
execution scope of a single SQL statement (such as a SELECT, INSERT, UPDATE, or
DELETE). It is similar to a derived table (subquery) but offers several distinct advantages in
terms of readability and reusability.
The CTE exists only for the duration of the query in which it is defined. It is created using the
WITH clause.
Main Benefits of Using CTEs
CTEs are primarily used to simplify complex queries and improve readability. Their main
benefits include:
1. Improved Readability and Organization: They break down complex, multi-step
queries into simpler, logical, and named blocks. This makes the code much easier to
read, understand, and debug, especially compared to deeply nested subqueries.
2. Reusability within a Single Query: A CTE can be referenced multiple times within
the same main query. This is particularly useful when you need to perform the same
initial calculation or filtering and use that result set in several subsequent joins or
calculations.
3. Enabling Recursive Queries: CTEs are the only way to write recursive queries in
SQL (queries that refer to themselves). This is essential for traversing hierarchical
data structures like organizational charts or bill-of-materials.
Simple SQL Example
This example demonstrates how a CTE can first calculate a derived value (the total sales
per employee) and then use that result set in the final query.
--Question 5 : Describe the concept of SQL Normalization and its primary goals. Briefly
explain the first three normal forms (1NF, 2NF, 3NF).
Answer- SQL Normalization
SQL Normalization is a systematic process of organizing the columns and tables in a
relational database to minimize data redundancy and improve data integrity. It involves
decomposing (breaking down) large tables into smaller, less redundant tables and defining
relationships between them.
Primary Goals of Normalization
The main objectives of normalization are:
1. Minimize Data Redundancy: Avoid storing the same piece of data multiple times.
This saves storage space and reduces the potential for inconsistencies.
2. Improve Data Integrity: Ensure that the data is accurate and reliable. By storing
data in only one place, you prevent update and insertion anomalies (issues that arise
when inserting, updating, or deleting data in a redundant table).
3. Enhance Database Flexibility: Make the database structure easier to modify and
extend without major structural changes.
🔑 The First Three Normal Forms
The most common levels of normalization are the first three normal forms (1NF, 2NF, 3NF):
1. First Normal Form (1NF)
Goal: Eliminate repeating groups and ensure data is atomic.
● Requirements:
1. Each table cell must contain a single, atomic value (indivisible).
2. There are no repeating groups of columns (e.g., Phone1, Phone2, Phone3).
Each record must be unique.
● Example: A table where one cell contains a list of comma-separated items (e.g.,
"Skiing, Biking") violates 1NF. To fix this, the table must be restructured so each item
is in its own row.
2. Second Normal Form (2NF)
Goal: Eliminate partial dependencies.
● Requirements:
1. The table must already be in 1NF.
2. All non-key attributes (columns that are not part of the primary key) must be
fully functionally dependent on the entire primary key.
● Scenario: This applies mainly to tables with a composite primary key (a key made
up of two or more columns). If a non-key column depends on only part of the
composite key, that column must be moved to a new table.
● Example: In an OrderDetails table (Primary Key: OrderID + ProductID), if the
ProductName only depends on ProductID (part of the key), it violates 2NF.
ProductName should be moved to a separate Products table.
3. Third Normal Form (3NF)
Goal: Eliminate transitive dependencies.
● Requirements:
1. The table must already be in 2NF.
2. There are no transitive dependencies. This means that a non-key attribute
cannot be dependent on another non-key attribute.
● Scenario: This removes non-key attributes that are determined by other non-key
attributes.
● Example: In an Employees table, if DepartmentName is dependent on
DepartmentID, and DepartmentID is dependent on the EmployeeID (the
primary key), then DepartmentName is transitively dependent on EmployeeID. To
achieve 3NF, the DepartmentID and DepartmentName must be moved to a
separate Departments table

---PRACTICAL QUESTION-
QUESTION6-

create database ECommerceDB;
use ECommerceDB
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL UNIQUE,
    CategoryID INT,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
); 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Home Goods'),
(4, 'Apparel');
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, StockQuantity) VALUES
(101, 'Laptop Pro', 1, 1200.00, 50),
(102, 'SQL Handbook', 2, 45.50, 200),
(103, 'Smart Speaker', 1, 99.99, 150),
(104, 'Coffee Maker', 3, 75.00, 80),
(105, 'Novel: The Great SQL', 2, 25.00, 120),
(106, 'Wireless Earbuds', 1, 150.00, 100),
(107, 'Blender X', 3, 120.00, 60),
(108, 'T-Shirt Casual', 4, 20.00, 300);
INSERT INTO Customers (CustomerID, CustomerName, Email, JoinDate) VALUES
(1, 'Alice Wonderland', 'alice@example.com', '2023-01-10'),
(2, 'Bob the Builder', 'bob@example.com', '2022-11-25'),
(3, 'Charlie Chaplin', 'charlie@example.com', '2023-03-01'),
(4, 'Diana Prince', 'diana@example.com', '2021-04-26');
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1001, 1, '2023-04-26', 1245.50),
(1002, 2, '2023-10-12', 99.99),
(1003, 1, '2023-07-01', 145.00),
(1004, 3, '2023-01-14', 150.00),
(1005, 2, '2023-09-24', 120.00),
(1006, 1, '2023-06-19', 20.00);
#Question 7 : Generate a report showing CustomerName, Email...alter
SELECT
    C.CustomerName,
    C.Email,
    -- Count the number of OrderIDs (aliased as 'O')
    -- LEFT JOIN ensures a row exists for every customer, 
    -- and COUNT() handles NULLs (zero orders) correctly.
    COUNT(O.OrderID) AS TotalNumberofOrders
FROM
    Customers C
LEFT JOIN
    Orders O ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID, C.CustomerName, C.Email
ORDER BY
    C.CustomerName;
    #question8-Retrieve Product Information with Category
    SELECT
    P.ProductName,
    P.Price,
    P.StockQuantity,
    C.CategoryName
FROM
    Products P
JOIN
    Categories C ON P.CategoryID = C.CategoryID
ORDER BY
    C.CategoryName,
    P.ProductName;
#Question9- Write a SQL query that uses a Common Table Expression (CTE)..
WITH RankedProducts AS (
    -- 1. Select the relevant columns and calculate the rank
    SELECT
        C.CategoryName,
        P.ProductName,
        P.Price,
        -- The RANK() window function partitions the data by CategoryName
        -- and orders it by Price in descending order (most expensive first).
        -- Products with the same price in the same category will receive the same rank.
        RANK() OVER (
            PARTITION BY C.CategoryName
            ORDER BY P.Price DESC
        ) AS PriceRank
    FROM
        Products P
    JOIN
        Categories C ON P.CategoryID = C.CategoryID
)
-- 2. Select the final results from the CTE
SELECT
    CategoryName,
    ProductName,
    Price
FROM
    RankedProducts
WHERE
    -- Filter to include only the top 2 products (Rank 1 and Rank 2)
    PriceRank <= 2
ORDER BY
    CategoryName, Price DESC;
    #Question10-
    create database sakila;
    use sakila;
    CREATE TABLE customer (
    customer_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    store_id TINYINT UNSIGNED NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    create_date DATETIME NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE rental (
    rental_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rental_date DATETIME NOT NULL,
    inventory_id MEDIUMINT UNSIGNED NOT NULL,
    customer_id SMALLINT UNSIGNED NOT NULL,
    return_date DATETIME,
    staff_id TINYINT UNSIGNED NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE payment (
    payment_id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id SMALLINT UNSIGNED NOT NULL,
    staff_id TINYINT UNSIGNED NOT NULL,
    rental_id INT,
    amount DECIMAL(5,2) NOT NULL,
    payment_date DATETIME NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE inventory (
    inventory_id MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    film_id SMALLINT UNSIGNED NOT NULL,
    store_id TINYINT UNSIGNED NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE category (
    category_id TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE film_category (
    film_id SMALLINT UNSIGNED NOT NULL,
    category_id TINYINT UNSIGNED NOT NULL,
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (film_id, category_id)
);
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS "Customer Name",
    c.email,
    SUM(p.amount) AS "Total Spent"
FROM
    customer c
JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY
    c.customer_id, c.first_name, c.last_name, c.email
ORDER BY
    "Total Spent" DESC
LIMIT 5;
SELECT
    cat.name AS "Category Name",
    COUNT(r.rental_id) AS "Rental Count"
FROM
    category cat
JOIN
    film_category fc ON cat.category_id = fc.category_id
JOIN
    inventory i ON fc.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    cat.name
ORDER BY
    "Rental Count" DESC
LIMIT 3;
SELECT
    i.store_id AS "Store ID",
    COUNT(i.inventory_id) AS "Total Films in Stock",
    SUM(CASE WHEN r.rental_id IS NULL THEN 1 ELSE 0 END) AS "Never Rented Count"
FROM
    inventory i
LEFT JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    i.store_id
ORDER BY
    i.store_id;
    SELECT
    DATE_FORMAT(p.payment_date, '') AS "Year-Month",
    SUM(p.amount) AS "Total Revenue"
FROM
    payment p
WHERE
    YEAR(p.payment_date) = 2023
GROUP BY
    "Year-Month"
ORDER BY
    "Year-Month";
  SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS "Customer Name",
    COUNT(r.rental_id) AS "Rental Count"
FROM
    customer c
JOIN
    rental r ON c.customer_id = r.customer_id
WHERE
    r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY
    c.customer_id, c.first_name, c.last_name
HAVING
    COUNT(r.rental_id) > 10
ORDER BY
    "Rental Count" DESC;
   


   