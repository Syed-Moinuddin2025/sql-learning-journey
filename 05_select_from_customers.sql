SELECT * 
FROM customers

SELECT * FROM orders

SELECT 
    first_name,
    country,
    score
FROM customers

UPDATE customers
SET country = 'Canada'
WHERE id = 18;