USE MyDatabase


SELECT * FROM customers

-- Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany'

-- Retrieve customers from India
SELECT * 
FROM customers
WHERE country = 'India'

-- Retrieve customers from UAE
SELECT * 
FROM customers 
WHERE country = 'UAE'

-- Retrieve customers from USA
SELECT first_name , country 
FROM customers
WHERE country = 'USA'

