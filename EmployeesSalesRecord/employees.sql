USE EmployeeSalesDB;

INSERT INTO [EmployeeSalesDB].[dbo].[employees] ([id], [first_name], [last_name], [department], [salary])
VALUES 
  (1, 'Paul', 'Garrix', 'Corporate', 3547.25),
  (2, 'Astrid', 'Fox', 'Private Individuals', 2845.56),
  (3, 'Matthias', 'Johnson', 'Private Individuals', 3009.41),
  (4, 'Lucy', 'Patterson', 'Private Individuals', 3547.25),
  (5, 'Tom', 'Page', 'Corporate', 5974.41),
  (6, 'Claudia', 'Conte', 'Corporate', 4714.12),
  (7, 'Walter', 'Deer', 'Private Individuals', 3547.25),
  (8, 'Stephanie', 'Marx', 'Corporate', 2894.51),
  (9, 'Luca', 'Pavarotti', 'Private Individuals', 4123.45),
  (10, 'Victoria', 'Pollock', 'Corporate', 4789.53);


SELECT * FROM employees;