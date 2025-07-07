# 📚 11_Library_SQL_Project
A comprehensive SQL Server-based Library Management System built using relational database concepts. The project includes table creation, data population, CRUD operations, CTAS, advanced analytics, and stored procedures — ideal for mastering SQL in a real-world use case.

# 🗂️ Project Structure
File Name	Description
01_create_tables.sql	Defines all tables: books, members, employees, etc.
02_data_insert_queries.sql	Inserts sample/mock data into the tables
03_medium_queries.sql	Intermediate-level queries like CRUD, filters, groupings
04_advanced_queries.sql	Advanced queries: overdue logic, CTAS reports, KPIs
05_stored_procedures.sql	Stored procedures for issuing and returning books

✅ Features & Concepts Covered
🔹 Database Design
Relational tables with foreign keys

Data integrity via constraints

🔸 CRUD Operations
Add/update/delete records

Track member and book data

📊 Analytics & Reporting
Most issued books

Overdue books & fine logic

Branch-wise performance

Active members in last 2 months

⚙️ Stored Procedures
issue_book → updates book status to no if issued

add_return_records → updates book status to yes on return

📌 Sample Tasks Implemented
Task ID	Description
6	CTAS: Create table for each book’s total issues
11	Books priced above $7
13	Identify members with books overdue beyond 30 days
15	Branch performance report (books issued, returned, revenue)
16	CTAS: Active members who issued books in last 2 months
17	Top 3 employees who processed most book issues
18	Members frequently issuing damaged books
19	Procedure to insert return records and auto-update book status
20	CTAS: Create table of overdue books with fine calculation ($0.50/day fine)

📌 Tables: Branch | Employees | Members | Books | Issued_Status | Return_Status
🔁 Relationships managed using foreign keys.
🚀 How to Run This Project
Open SQL Server Management Studio (SSMS)

Run 01_create_tables.sql

Run 02_data_insert_queries.sql

Run query files in order: 03_medium_queries.sql, 04_advanced_queries.sql

Execute stored procedures from 05_stored_procedures.sql

🎓 Learning Outcomes
SQL Server syntax mastery

CTAS & DATEDIFF usage

Stored procedure creation and execution

Real-world scenario simulation for library operations

# 👨‍💻 Author
Syed Moinuddin
SQL Developer | Python Learner | Data Analyst
📎 GitHub Profile