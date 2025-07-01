-- Blinkit Analysis SQL Script
-- Importing the data from the CSV file into a SQL table named blinkit_data

--	See all the data imported:
select * from blinkit_data
/*	DATA CLEANING:
Cleaning the Item_Fat_Content field ensures data consistency and accuracy in analysis. The presence of multiple variations of the same category (e.g., LF, low fat vs. Low Fat) can cause issues in reporting, aggregations, and filtering. By standardizing these values, we improve data quality, making it easier to generate insights and maintain uniformity in our datasets.
*/
UPDATE blinkit_data
SET Item_Fat_Content = 
    CASE 
        WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;

--After executing this query check the data has been cleaned or not using below query
SELECT DISTINCT Item_Fat_Content FROM blinkit_data;

--1-Total Sales: The overall revenue generated from all items sold.
select sum(Total_Sales) AS Total_Sales from blinkit_data

--1-Total_Sales_Million
SELECT CAST(SUM(Total_Sales) / 1000000.0 AS DECIMAL(10,2)) AS Total_Sales_Million
FROM blinkit_data;

--2-Average Sales: The average revenue per sale.
SELECT CAST(AVG(Total_Sales) AS INT) AS Avg_Sales
FROM blinkit_data;

--3-Number of Items: The total count of different items sold.
select COUNT(*) AS No_of_Items from blinkit_data

--4-Average Rating: The average customer rating for items sold. 
SELECT CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data;

SELECT CAST(AVG(Total_Sales) AS DECIMAL (10,2)) AS Avg_Sales
FROM blinkit_data
WHERE Item_Fat_Content = 'Low Fat'

SELECT 
	CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
	FROM blinkit_data
WHERE Item_Fat_Content = 'Low Fat';

SELECT 
  CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
		FROM blinkit_data
		WHERE Outlet_Establishment_Year =2022

/*Objective: Analyze the impact of fat content on total sales.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.*/
	
--1. Total Sales by Fat Content:
SELECT Item_Fat_Content, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
	FROM blinkit_data
	GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC
--

SELECT Item_Fat_Content,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC
--
SELECT Item_Fat_Content,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
WHERE Outlet_Establishment_Year =2022
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC
--
/*	Objective: Identify the performance of different item types in terms of total sales.Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.*/
--2. Total Sales by Item Type:

SELECT Item_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
		FROM blinkit_data
		GROUP BY Item_Type
ORDER BY Total_Sales DESC
--
SELECT Item_Type,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC
--
SELECT TOP 5 Item_Type,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC
--
SELECT TOP 5 Item_Type,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales ASC

/*3.Fat Content by Outlet for Total Sales:
	Objective: Compare total sales across different outlets segmented by fat content.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.*/
SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

/*4. Total Sales by Outlet Establishment:
	Objective: Evaluate how the age or type of outlet establishment influences total sales.*/
SELECT Outlet_Establishment_Year, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
	FROM blinkit_data
	GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year

SELECT Outlet_Establishment_Year,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC

SELECT Outlet_Establishment_Year,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC

/*5. Percentage of Sales by Outlet Size:
	Objective: Analyze the correlation between outlet size and total sales.*/
SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

/*6. Sales by Outlet Location:
	Objective: Assess the geographic distribution of sales across different locations.*/
SELECT Outlet_Location_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
		FROM blinkit_data
		GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC
--
SELECT Outlet_Location_Type,
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
From blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC
--
SELECT 
  Outlet_Location_Type,
	  CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
	  CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	  CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	  COUNT(*) AS No_Of_Items,
	  CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;
--
SELECT 
  Outlet_Location_Type,
	  CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
	  CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	  CAST(AVG(Total_Sales) AS DECIMAL(10,1)) AS Avg_Sales,
	  COUNT(*) AS No_Of_Items,
	  CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year =2022
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

/*7. All Metrics by Outlet Type:
	Objective: Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of 	Items, Average Rating) broken down by different outlet types.*/
SELECT Outlet_Type, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC
