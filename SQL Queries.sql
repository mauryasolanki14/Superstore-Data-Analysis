CREATE DATABASE superstore_db;
USE superstore_db;
CREATE TABLE sales_data (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

-- Total Revenue
SELECT SUM(Sales) AS Total_Revenue 
FROM sales_data;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit 
FROM sales_data;

-- Monthly Revenue 
SELECT 
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Revenue
FROM sales_data
GROUP BY Month
ORDER BY Month;

-- top 10 customer
SELECT Customer_Name,
       SUM(Sales) AS Total_Spent
FROM sales_data
GROUP BY Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;

-- Category Wise Sales
SELECT Category,
       SUM(Sales) AS Category_Sales
FROM sales_data
GROUP BY Category;

-- Region Wise Profit
SELECT Region,
       SUM(Profit) AS Region_Profit
FROM sales_data
GROUP BY Region;