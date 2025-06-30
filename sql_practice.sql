-- SQL Practice Script: Basics
-- ✅ Use this in VS Code with MS SQL extension

-- 1. View all Employees
SELECT * FROM Employees

-- 2. View all Departments
SELECT * FROM Departments
 
 -- 3. View all Designations
 SELECT * FROM Designations

 -- 4. View all Salaries
 SELECT * FROM Salaries

 -- 5. Insert a new Employee
 INSERT INTO Employees (EmpID,FirstName,LastName ,DeptID , DesigID , JoinDate)
 VALUES (208 , 'Tania' , 'Agarwal' , 2,2, '2022-03-1');

 --6: Insert Salary for new Employee (208)
INSERT INTO Salaries (EmpID ,BasicSalary, Allowance,Deductions )
 VALUES(208, 48000,3000,1500);

 -- 7. Update an Employee's Designation
UPDATE Employees
 SET DesigID = 4
WHERE EmpID = 206;

 -- 7. Delete an Employee

DELETE FROM Salaries
WHERE EmpID = 206

DELETE from Employees
WHERE EmpID = 206;

-- 8. Add a new column to Salaries table
ALTER TABLE Salaries
ADD Bonus DECIMAL(10,2)

-- 9. Update Bonus for an employee
UPDATE Salaries
SET Bonus = 2500
WHERE EmpID =205;

-- 10. Drop the Bonus column 
ALTER TABLE salaries
DROP COLUMN Bonus;

-- ✅ INTERMEDIATE LEVEL QUERIES (JOIN, GROUP BY, CASE)
SELECT E.EmpID, FirstName, LastName, BasicSalary, Allowance
FROM Employees E
JOIN Salaries S ON E.EmpID = S.EmpID;

-- 12. Join Employees with Departments
SELECT E.FirstName , E.LastName , D.DeptName
FROM Employees E
JOIN Departments D ON E.DeptID = D.DeptID

-- 13. Total Salary (Basic + Allowance) for each employee
SELECT EmpID , (BasicSalary + Allowance) AS  TotalSalary
From salaries

-- 14. Use CASE to show tax status
SELECT EmpID, BasicSalary,
  CASE 
    WHEN BasicSalary > 5000 THEN 'Taxable'
    ELSE 'Non-Taxable'
  END AS TaxStatus
FROM Salaries;

-- 15. Count employees in each department
SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DeptID;

-- 16. Average salary per department
SELECT E.DeptID, AVG(S.BasicSalary) AS AvgSalary
FROM Employees E
JOIN Salaries S ON E.EmpID = S.EmpID
GROUP BY E.DeptID;

-- 17. Employees who joined after 2022
SELECT * FROM Employees
WHERE JoinDate > '2022-01-01';

-- 18. Get top 3 highest salaries
SELECT TOP 3 EmpID, BasicSalary
FROM Salaries
ORDER BY BasicSalary DESC;

-- 19. Employees without salary records
SELECT *
FROM Employees
WHERE EmpID NOT IN (SELECT EmpID FROM Salaries);

-- 20. Show full name and total salary
SELECT FirstName + ' ' + LastName AS FullName,
       (BasicSalary + Allowance - ISNULL(Deductions, 0)) AS NetSalary
FROM Employees E
JOIN Salaries S ON E.EmpID = S.EmpID;

-- ✅ You're now practicing SELECT, INSERT, UPDATE, DELETE, ALTER, JOIN, GROUP BY, CASE
SELECT EmpID, Bonus FROM Salaries;

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Salaries';

UPDATE Salaries
SET Bonus = 2500
WHERE EmpID = 201;

UPDATE Salaries
SET Bonus = 1000
WHERE Bonus IS NULL;

