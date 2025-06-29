use InventoryDB

-- Project 1: Mini Store Inventory
-- Basic SQL Queries

-- 1. View all categories
SELECT * FROM Categories;

-- 2. View all products
SELECT * FROM Products;

-- 3. List all products with their category names (JOIN)
SELECT 
    P.ProductID,
    P.ProductName,
    P.Price,
    P.Quantity,
    C.CategoryName
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID;

-- 4. List all products in the 'Electronics' category
SELECT 
    ProductName, Price, Quantity
FROM Products
WHERE CategoryID = 1;

-- 5. Show products with quantity less than 20 (Low stock)
SELECT 
    ProductName, Quantity
FROM Products
WHERE Quantity < 20;

-- 6. Calculate total number of products in inventory
SELECT COUNT(*) AS TotalProducts FROM Products;

-- 7. Calculate total inventory stock (sum of quantities)
SELECT SUM(Quantity) AS TotalUnitsInStock FROM Products;

-- 8. Calculate total inventory value (Price × Quantity)
SELECT 
    SUM(Price * Quantity) AS TotalInventoryValue
FROM Products;

-- 9. Show average price of all products
SELECT AVG(Price) AS AverageProductPrice FROM Products;

-- 10. Show the most expensive product
SELECT TOP 1 *
FROM Products
ORDER BY Price DESC;


-- 11. Show products grouped by category with total quantity per category
SELECT 
    C.CategoryName,
    SUM(P.Quantity) AS TotalUnits
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

--12. Show how many products are in each category
SELECT 
    C.CategoryName,
    COUNT(P.ProductID) AS NumberOfProducts
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

--13. Show the cheapest product in each category
SELECT 
    C.CategoryName,
    MIN(P.Price) AS CheapestPrice
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

--14. Show only the products that are out of stock (quantity = 0)
SELECT 
    ProductName
FROM Products
WHERE Quantity = 0;

--15. Show top 3 most expensive products
SELECT TOP 3 
    ProductName, Price
FROM Products
ORDER BY Price DESC;

--16. Show all products with total value (Price × Quantity) per product
SELECT 
    ProductID,
    ProductName,
    Price,
    Quantity,
    (Price * Quantity) AS TotalValue
FROM Products;

--17. List categories that have more than 2 products
SELECT 
    C.CategoryName,
    COUNT(P.ProductID) AS ProductCount
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
HAVING COUNT(P.ProductID) > 2;

-- 18. Find the category with the highest total inventory value
SELECT TOP 1 
    C.CategoryName,
    SUM(P.Price * P.Quantity) AS InventoryValue
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY InventoryValue DESC;

--19. Show all products sorted alphabetically (A–Z)
SELECT 
    ProductName,
    Price,
    Quantity
FROM Products
ORDER BY ProductName ASC;

-- 20. Show products that cost more than the average price
SELECT 
    ProductName,
    Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);































--🔎 1. Show all products with category names (JOIN)
SELECT 
    P.ProductID,
    P.ProductName,
    P.Price,
    P.Quantity,
    C.CategoryName
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID;

--📉 2. List products with quantity less than 20 (low stock)
SELECT ProductName, Quantity
FROM Products
WHERE Quantity < 20;

--💲 3. Show total inventory value for each product (Price × Quantity)
SELECT 
ProductName,
Price,
Quantity,
(Price * Quantity) AS TotalValue
FROM Products

--🗃️ 4. Count how many products are in each category
SELECT 
    C.CategoryName,
    COUNT(P.ProductID) AS ProductCount
FROM Categories C
LEFT JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryName;

--💰 5. Total inventory value per category
SELECT 
    c.CategoryName ,
    SUM(P.Price * P.Quantity) AS TotalCategoryValue
FROM Categories C
JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY CategoryName;

--🧾 6. Show most expensive product in each category
SELECT 
    C.CategoryName,
    P.ProductName,
    P.Price
FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE P.Price = (
    SELECT MAX(P2.Price)
    FROM Products P2
    WHERE P2.CategoryID = P.CategoryID
);

--⏳ 7. Products sorted by Quantity (low to high)
SELECT ProductName, Quantity
FROM Products
ORDER BY Quantity ASC;

--📊 8. Group products by price range
SELECT 
    CASE 
        WHEN Price < 10 THEN 'Under $10'
        WHEN Price BETWEEN 10 AND 50 THEN '$10 - $50'
        ELSE 'Above $50'
    END AS PriceRange,
    COUNT(*) AS ProductCount
FROM Products
GROUP BY 
    CASE 
        WHEN Price < 10 THEN 'Under $10'
        WHEN Price BETWEEN 10 AND 50 THEN '$10 - $50'
        ELSE 'Above $50'
    END;

