SELECT * FROM Categories;
SELECT * FROM Products;

SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS TotalProducts,
    SUM(p.Quantity) AS TotalStock
FROM
    Products p
JOIN
    Categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryName
ORDER BY 
    c.CategoryName;