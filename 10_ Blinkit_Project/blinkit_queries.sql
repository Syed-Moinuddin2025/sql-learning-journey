-- 📦 Blinkit Sales Analysis SQL Project
-- ✅ Cleaned and Enhanced SQL Script with KPI Insights & Challenge Levels

-- 0. View All Data
SELECT * FROM blinkit_data;

-- 1. 🔧 DATA CLEANING: Standardize Item_Fat_Content
UPDATE blinkit_data
SET Item_Fat_Content = 
    CASE 
        WHEN LOWER(Item_Fat_Content) IN ('lf', 'low fat') THEN 'Low Fat'
        WHEN LOWER(Item_Fat_Content) = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;

-- 🔍 Check distinct values after cleaning
SELECT DISTINCT Item_Fat_Content FROM blinkit_data;


-- ========================
-- 📘 BASIC LEVEL QUERIES
-- ========================

-- 2. Total Sales
SELECT SUM(Total_Sales) AS Total_Sales FROM blinkit_data;

-- 3. Total Sales in Millions
SELECT CAST(SUM(Total_Sales) / 1000000.0 AS DECIMAL(10,2)) AS Total_Sales_Million FROM blinkit_data;

-- 4. Average Sales
SELECT CAST(AVG(Total_Sales) AS INT) AS Avg_Sales FROM blinkit_data;

-- 5. Number of Records (All Items Sold)
SELECT COUNT(*) AS Total_Items_Sold FROM blinkit_data;

-- 6. Average Rating
SELECT CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating FROM blinkit_data;

-- 7. Unique Item Types
SELECT COUNT(DISTINCT Item_Type) AS Unique_Item_Types FROM blinkit_data;

-- 8. Sales Filtered by Fat Content = 'Low Fat'
SELECT CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Low_Fat_Sales FROM blinkit_data WHERE Item_Fat_Content = 'Low Fat';

-- 9. Average Sales for Low Fat Items
SELECT CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales_LowFat FROM blinkit_data WHERE Item_Fat_Content = 'Low Fat';

-- 10. Total Sales in Year 2022
SELECT CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales_2022 FROM blinkit_data WHERE Outlet_Establishment_Year = 2022;


-- ============================
-- 📙 INTERMEDIATE LEVEL KPIs
-- ============================

-- 11. Total Sales by Fat Content
SELECT Item_Fat_Content, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC;

-- 12. Full Metrics by Fat Content
SELECT Item_Fat_Content,
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
       COUNT(*) AS No_of_Items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC;

-- 13. Top 5 Item Types by Sales
SELECT TOP 5 Item_Type, 
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

-- 14. Sales by Outlet Location Type (Full Metrics)
SELECT Outlet_Location_Type,
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
       COUNT(*) AS No_Of_Items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

-- 15. Sales Percentage by Outlet Size
SELECT Outlet_Size, 
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

-- 16. Pivot Table: Sales by Fat Content per Location
SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM (
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT (
    SUM(Total_Sales) FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

-- ==========================
-- 📕 ADVANCED LEVEL INSIGHTS
-- ==========================

-- 17. All KPIs by Outlet Type
SELECT Outlet_Type, 
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
       COUNT(*) AS No_Of_Items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
       CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Avg_Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

-- 18. Rank Outlets by Sales
SELECT Outlet_Type,
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       RANK() OVER (ORDER BY SUM(Total_Sales) DESC) AS Sales_Rank
FROM blinkit_data
GROUP BY Outlet_Type;

-- 19. Visibility Impact: Correlation between Item_Visibility & Sales Bucket
SELECT 
  CASE 
    WHEN Item_Visibility < 0.05 THEN 'Low Visibility'
    WHEN Item_Visibility BETWEEN 0.05 AND 0.15 THEN 'Medium Visibility'
    ELSE 'High Visibility' END AS Visibility_Level,
  COUNT(*) AS Items_Count,
  CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales
FROM blinkit_data
GROUP BY CASE 
    WHEN Item_Visibility < 0.05 THEN 'Low Visibility'
    WHEN Item_Visibility BETWEEN 0.05 AND 0.15 THEN 'Medium Visibility'
    ELSE 'High Visibility' END
ORDER BY Avg_Sales DESC;

-- 20. Year-wise Performance (Full KPI View)
SELECT Outlet_Establishment_Year,
       CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
       COUNT(*) AS No_Of_Items,
       CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
       CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;
