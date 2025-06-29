-- 1. View all employees
SELECT * FROM Employees;

-- 2. List all departments
SELECT * FROM Departments;

-- 3. List employees with their department names (JOIN)
SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- 4. Show all employees hired after 2020
SELECT 
    FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > '2020-01-01';

-- 5. List employees with salaries above 60,000
SELECT 
    FirstName, LastName, Salary
FROM Employees
WHERE Salary > 60000;

-- 6. Show total number of employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- 7. Show average salary
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- 8. Show highest-paid employee
SELECT TOP 1 * 
FROM Employees
ORDER BY Salary DESC;

-- 9. Show employees by department (grouped count)
SELECT 
    D.DepartmentName,
    COUNT(E.EmployeeID) AS NumEmployees
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

-- 10. Show salary of each employee along with job title
SELECT 
    E.FirstName,
    E.LastName,
    J.JobTitle,
    E.Salary
FROM Employees E
JOIN Jobs J ON E.JobID = J.JobID;
