 -- Departments
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');

-- Job Titles
INSERT INTO JobTitles VALUES
(1, 'Software Engineer'),
(2, 'HR Manager'),
(3, 'Sales Executive'),
(4, 'Accountant'),
(5, 'Senior Developer'),
(6, 'Marketing Specialist'),
(7, 'Finance Manager'),
(8, 'HR Assistant'),
(9, 'Sales Trainee'),
(10, 'Content Creator'),
(11, 'HR Executive'),
(12, 'Team Lead'),
(13, 'Sales Manager'),
(14, 'Junior Accountant'),
(15, 'Brand Strategist');

-- Employees
INSERT INTO Employees VALUES
(101, 'Ali', 'Khan', 'Male', '1990-05-12', '2015-06-01', 1),
(102, 'Sara', 'Ahmed', 'Female', '1988-11-23', '2016-03-10', 2),
(103, 'Omar', 'Zaid', 'Male', '1992-07-18', '2018-01-25', 3),
(104, 'Nadia', 'Farooq', 'Female', '1985-03-14', '2019-08-15', 4),
(105, 'Hassan', 'Raza', 'Male', '1980-09-30', '2010-09-01', 1),
(106, 'Ayesha', 'Malik', 'Female', '1991-01-11', '2017-05-20', 5),
(107, 'Bilal', 'Sheikh', 'Male', '1983-12-19', '2012-11-01', 4),
(108, 'Zara', 'Siddiqui', 'Female', '1995-02-02', '2020-02-10', 2),
(109, 'Imran', 'Ali', 'Male', '1998-04-22', '2021-03-15', 3),
(110, 'Fatima', 'Khalid', 'Female', '1994-06-30', '2022-06-01', 5);

-- Job Assignments
INSERT INTO JobAssignments VALUES
(1, 101, '2015-06-01', NULL),
(2, 102, '2016-03-10', NULL),
(3, 103, '2018-01-25', NULL),
(4, 104, '2019-08-15', NULL),
(5, 105, '2010-09-01', NULL),
(6, 106, '2017-05-20', NULL),
(7, 107, '2012-11-01', NULL),
(8, 108, '2020-02-10', NULL),
(9, 109, '2021-03-15', NULL),
(10, 110, '2022-06-01', NULL);

-- Salaries
INSERT INTO Salaries VALUES
(101, 70000, 5000, 2000),
(102, 60000, 4000, 1500),
(103, 55000, 3500, 1200),
(104, 50000, 3000, 1000),
(105, 80000, 6000, 2500),
(106, 45000, 2500, 900),
(107, 65000, 4500, 1800),
(108, 40000, 2000, 700),
(109, 35000, 1500, 600),
(110, 42000, 2200, 800);