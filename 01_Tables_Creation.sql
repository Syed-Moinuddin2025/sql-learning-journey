-- Create new database
--CREATE DATABASE PythonPracticeDB;
GO

-- Use the new database
USE PythonPracticeDB;
GO

-- Create Departments Table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName NVARCHAR(100) NOT NULL
);

-- Create Designations Table
CREATE TABLE Designations (
    DesigID INT PRIMARY KEY,
    DesigTitle NVARCHAR(100) NOT NULL
);

-- Create Employees Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DeptID INT FOREIGN KEY REFERENCES Departments(DeptID),
    DesigID INT FOREIGN KEY REFERENCES Designations(DesigID),
    JoinDate DATE
);

-- Create Salaries Table
CREATE TABLE Salaries (
    EmpID INT PRIMARY KEY FOREIGN KEY REFERENCES Employees(EmpID),
    BasicSalary DECIMAL(10,2),
    Allowance DECIMAL(10,2),
    Deductions DECIMAL(10,2)
);

-- Insert sample data into Departments
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance');

-- Insert sample data into Designations
INSERT INTO Designations VALUES
(1, 'Software Engineer'),
(2, 'HR Executive'),
(3, 'Sales Associate'),
(4, 'Accountant');

-- Insert sample data into Employees
INSERT INTO Employees VALUES
(201, 'Ahmed', 'Khan', 1, 1, '2020-01-10'),
(202, 'Zara', 'Sheikh', 2, 2, '2021-05-15'),
(203, 'Imran', 'Ali', 3, 3, '2019-11-01'),
(204, 'Sana', 'Malik', 4, 4, '2018-06-20');

-- Insert sample data into Salaries
INSERT INTO Salaries VALUES
(201, 60000, 5000, 2000),
(202, 50000, 4000, 1500),
(203, 45000, 3000, 1200),
(204, 55000, 3500, 1700);

-- ✅ Ready to connect via Python for practice!
 
 SELECT * FROM Employees