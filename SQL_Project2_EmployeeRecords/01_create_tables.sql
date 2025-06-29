 

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL
);

-- JobTitles Table
CREATE TABLE JobTitles (
    JobTitleID INT PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Gender NVARCHAR(10),
    DateOfBirth DATE,
    HireDate DATE,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);

-- JobAssignments Table
CREATE TABLE JobAssignments (
    JobTitleID INT FOREIGN KEY REFERENCES JobTitles(JobTitleID),
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    FromDate DATE,
    ToDate DATE,
    PRIMARY KEY (EmployeeID, JobTitleID)
);

-- Salaries Table
CREATE TABLE Salaries (
    EmployeeID INT PRIMARY KEY FOREIGN KEY REFERENCES Employees(EmployeeID),
    BasicSalary DECIMAL(10, 2),
    Allowance DECIMAL(10, 2),
    Deductions DECIMAL(10, 2)
);

