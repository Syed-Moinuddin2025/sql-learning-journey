-- 📘 STEP 1: Basic SELECT queries

-- 1. Select all employees
SELECT * FROM employees;

-- 2. Select employee names and salary
SELECT first_name, last_name, salary FROM employees;

-- 3. Select employees with salary above 4000
SELECT * FROM employees WHERE salary > 4000;

-- 4. Select employees from Corporate department
SELECT * FROM employees WHERE department = 'Corporate';

-- 5. Order employees by salary descending
SELECT * FROM employees ORDER BY salary DESC;

-- 6. Get unique departments
SELECT DISTINCT department FROM employees;

-- 7. Count total number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- 8. Get average salary of all employees
SELECT AVG(salary) AS avg_salary FROM employees;

-- 9. Get total salary paid
SELECT SUM(salary) AS total_salary FROM employees;

-- 10. Get employees with name starting with 'P'
SELECT * FROM employees WHERE first_name LIKE 'P%';

-- 📗 STEP 2: Join Queries

-- 11. List employee names and their Q1 sales
SELECT e.first_name, e.last_name, qs.q1_2022
FROM employees e
JOIN quarterly_sales qs ON e.id = qs.employee_id;

-- 12. Total annual sales for each employee
SELECT e.first_name, e.last_name,
       (qs.q1_2022 + qs.q2_2022 + qs.q3_2022 + qs.q4_2022) AS total_sales
FROM employees e
JOIN quarterly_sales qs ON e.id = qs.employee_id;

-- 13. Top 3 employees by total sales
SELECT TOP 3 e.first_name, e.last_name,
       (qs.q1_2022 + qs.q2_2022 + qs.q3_2022 + qs.q4_2022) AS total_sales
FROM employees e
JOIN quarterly_sales qs ON e.id = qs.employee_id
ORDER BY total_sales DESC;

-- 14. Department-wise average salary
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 15. Total Q2 sales across all employees
SELECT SUM(q2_2022) AS total_q2_sales FROM quarterly_sales;

-- 📙 STEP 3: UPDATE and DELETE

-- 16. Update salary of an employee
UPDATE employees SET salary = 6000 WHERE id = 1;

-- 17. Update department of all employees with salary < 3000
UPDATE employees SET department = 'Support' WHERE salary < 3000;

-- 18. Delete an employee record
-- DELETE FROM employees WHERE id = 10; -- Uncomment to run

-- 📒 STEP 4: ALTER TABLE operations

-- 19. Add a new column 'email' to employees table
ALTER TABLE employees ADD email VARCHAR(100);

-- 20. Update email for one employee
UPDATE employees SET email = 'paul.garrix@company.com' WHERE id = 1;

-- 21. Rename column 'salary' to 'monthly_salary'
EXEC sp_rename 'employees.salary', 'monthly_salary', 'COLUMN';

-- 📕 STEP 5: Aggregation + Filtering

-- 22. Get employees with total annual sales > 25000
SELECT 
  e.first_name, 
  e.last_name,
  (qs.q1_2022 + qs.q2_2022 + qs.q3_2022 + qs.q4_2022) AS total_sales
FROM employees e
JOIN quarterly_sales qs ON e.id = qs.employee_id
WHERE (qs.q1_2022 + qs.q2_2022 + qs.q3_2022 + qs.q4_2022) > 25000;

-- 23. Group employees by department and count them
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 24. Maximum salary in each department
SELECT department, MAX(monthly_salary) AS max_salary
FROM employees
GROUP BY department;

-- 📔 STEP 6: Subqueries

-- 25. Get employees earning more than average salary
SELECT * FROM employees
WHERE monthly_salary > (SELECT AVG(monthly_salary) FROM employees);

-- 26. Employees whose total sales are above average
SELECT e.first_name, e.last_name
FROM employees e
JOIN quarterly_sales qs ON e.id = qs.employee_id
WHERE (qs.q1_2022 + qs.q2_2022 + qs.q3_2022 + qs.q4_2022) >
      (SELECT AVG(q1_2022 + q2_2022 + q3_2022 + q4_2022) FROM quarterly_sales);

-- 📙 STEP 7: Advanced Ordering

-- 27. Bottom 3 earners
SELECT TOP 3 * FROM employees ORDER BY monthly_salary ASC;

-- 28. Highest Q3 seller
SELECT TOP 1 e.first_name, e.last_name, qs.q3_2022
FROM employees e
JOIN quarterly_sales qs ON e.id = qs.employee_id
ORDER BY qs.q3_2022 DESC;

-- 29. Employees who sold more than 10000 in Q1 or Q2
SELECT e.first_name, e.last_name, qs.q1_2022, qs.q2_2022
FROM employees e
JOIN quarterly_sales qs ON e.id = qs.employee_id
WHERE qs.q1_2022 > 10000 OR qs.q2_2022 > 10000;

-- 30. Total sales for each quarter
SELECT
  SUM(q1_2022) AS total_q1,
  SUM(q2_2022) AS total_q2,
  SUM(q3_2022) AS total_q3,
  SUM(q4_2022) AS total_q4
FROM quarterly_sales;
