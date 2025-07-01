INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Groceries'),
(3, 'Stationery');
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(4, 'Furniture'),
(5, 'Clothing');
 




INSERT INTO Products (ProductID, ProductName, Price, Quantity, CategoryID) VALUES
(101, 'Laptop', 1200.00, 5, 1),
(102, 'Smartphone', 850.00, 8, 1),
(103, 'LED Bulb', 2.50, 100, 2),
(104, 'Rice (5kg)', 15.00, 20, 2),
(105, 'Milk Pack', 1.20, 50, 2),
(106, 'Notebook', 1.00, 75, 3),
(107, 'Ball Pen', 0.50, 200, 3),
(108, 'Charger', 20.00, 12, 1),
(109, 'Sugar (2kg)', 3.50, 25, 2),
(110, 'Stapler', 2.00, 15, 3);
INSERT INTO Products (ProductID, ProductName, Price, Quantity, CategoryID) VALUES
(111, 'Office Chair', 150.00, 10, 4),
(112, 'Dining Table', 300.00, 3, 4),
(113, 'T-Shirt', 15.00, 30, 5),
(114, 'Jeans', 40.00, 20, 5),
(115, 'Sneakers', 60.00, 25, 5),
(116, 'Sofa Set', 500.00, 2, 4),
(117, 'Desk Lamp', 25.00, 15, 1),
(118, 'Printer', 200.00, 4, 1),
(119, 'Eggs (dozen)', 2.50, 40, 2),
(120, 'Pencil Case', 3.00, 30, 3),
(121, 'Backpack', 45.00, 10, 3),
(122, 'Blender', 75.00, 6, 1),
(123, 'Couch', 600.00, 1, 4),
(124, 'Dress', 50.00, 15, 5),
(125, 'Shorts', 20.00, 18, 5),
(126, 'Monitor', 180.00, 7, 1),
(127, 'Keyboard', 30.00, 20, 1),
(128, 'Mouse', 15.00, 25, 1),
(129, 'Headphones', 40.00, 10, 1),
(130, 'Tablet', 200.00, 5, 1),
(131, 'Coffee Maker', 100.00, 8, 1),
(132, 'Water Bottle', 10.00, 50, 2),
(133, 'Cereal Box', 4.00, 30, 2),
(134, 'Toothpaste', 2.00, 60, 2),
(135, 'Shampoo', 5.00, 40, 2),
(136, 'Conditioner', 5.00, 35, 2),
(137, 'Soap Bar', 1.50, 80, 2),
(138, 'Dish Soap', 3.00, 25, 2),
(139, 'Laundry Detergent', 10.00, 15, 2),
(140, 'Toilet Paper', 6.00, 20, 2),
(141, 'Paper Towels', 4.00, 30, 2),
(142, 'Trash Bags', 5.00, 25, 2),
(143, 'Sponges', 2.50, 40, 2),
(144, 'Cleaning Spray', 3.50, 20, 2),
(145, 'Mop', 10.00, 15, 2),
(146, 'Broom', 8.00, 20, 2),
(147, 'Dustpan', 1.00, 50, 2),
(148, 'Bucket', 3.00, 30, 2),
(149, 'Sponge Mop', 12.00, 10, 2),
(150, 'Feather Duster', 5.00, 15, 2);



SELECT
    p.ProductID,
    p.ProductName,
    p.Price,
    p.Quantity,
    c.CategoryName  
FROM
    Products p  
JOIN
    Categories c ON p.CategoryID = c.CategoryID


SELECT 
    f.name AS ForeignKey,
    OBJECT_NAME(f.parent_object_id) AS TableName,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
    OBJECT_NAME (f.referenced_object_id) AS ReferenceTableName,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ReferenceColumnName
FROM 
    sys.foreign_keys AS f
INNER JOIN 
    sys.foreign_key_columns AS fc 
    ON f.object_id = fc.constraint_object_id
WHERE 
    OBJECT_NAME(f.parent_object_id) = 'Products';

-- ALTER TABLE Products
-- ADD CONSTRAINT FK_Products_Categories
-- FOREIGN KEY (CategoryID)
-- REFERENCES Categories(CategoryID);

-- ALTER TABLE Products
-- DROP CONSTRAINT FK__Products__Catego__412EB0B6;

-- SELECT 
--     f.name AS ForeignKey,
--     delete_referential_action_desc AS OnDelete,
--     update_referential_action_desc AS OnUpdate
-- FROM 
--     sys.foreign_keys f
-- WHERE 
--     f.name = 'FK_Products_Categories';