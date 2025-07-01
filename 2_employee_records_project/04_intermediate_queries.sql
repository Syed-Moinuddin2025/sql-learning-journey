-- 1. List employees with experience more than 3 years
SELECT 
    FirstName, LastName, HireDate,
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) > 3;

-- 2. Show highest salary by department
SELECT 
    D.DepartmentName,
    MAX(E.Salary) AS HighestSalary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

-- 3. List employees whose names start with 'A'
SELECT 
    FirstName, LastName
FROM Employees
WHERE FirstName LIKE 'A%';

-- 4. Show count of employees hired per year
SELECT 
    YEAR(HireDate) AS HireYear,
    COUNT(*) AS NumHired
FROM Employees
GROUP BY YEAR(HireDate)
ORDER BY HireYear;

-- 5. Show total payroll cost by department
SELECT 
    D.DepartmentName,
    SUM(E.Salary) AS TotalDepartmentSalary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

-- 6. List employees with job title and department
SELECT 
    E.FirstName,
    E.LastName,
    J.JobTitle,
    D.DepartmentName
FROM Employees E
JOIN Jobs J ON E.JobID = J.JobID
JOIN Departments D ON E.DepartmentID = D.DepartmentID;
