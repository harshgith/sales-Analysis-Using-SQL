SELECT * FROM sql1.sales;
use sql1;
-- 1 same day shipping percentage
SELECT
    ROUND((COUNT(DISTINCT Order_ID) / (SELECT COUNT(DISTINCT Order_ID) AS total_orders FROM sales)) * 100, 2) AS Same_Day_Shipping_Percentage
FROM
    sales
WHERE
    Order_Date = Ship_Date;

-- 2 top 4  items with highest average sales per day

select Product_ID, Round(AVG(sales),3) as average_sales from sales group by Product_ID  order by average_sales DESC limit 4;
-- 3 average order value of customer and rank them 
 SELECT
    Customer_Name,
    ROUND(AVG(sales), 3) AS avg_order_value,
    DENSE_RANK() OVER (ORDER BY AVG(sales) DESC) AS sales_rank
FROM
    sales
GROUP BY
    Customer_Name;

-- 4 most demanded sub-category in east region
SELECT
    Sub_Category,
    ROUND(SUM(sales), 3) AS total_quantity
FROM
    sales

WHERE
    Region = 'East'
GROUP BY
    Sub_Category
ORDER BY
    total_quantity DESC
LIMIT 1;

-- 5 order with highest number of items
SELECT
    order_id,
    COUNT(order_id) AS num_item
FROM
    sales
GROUP BY
    order_id
ORDER BY
    num_item DESC
LIMIT 1;

-- 6 order with highest cumulative value
SELECT
    order_id,
    ROUND(SUM(sales), 3) AS order_value
FROM
    sales
GROUP BY
    order_id
ORDER BY
    order_value DESC
LIMIT 1;

-- 7 Priority for First Class Shipment with respect tot segment
SELECT
    segment,
    COUNT(order_id) AS num_of_ordr
FROM
    sales
WHERE
    ship_mode = 'First Class'
GROUP BY
    segment
ORDER BY
    num_of_ordr DESC;
    
-- 8 city with least revenue

SELECT
    city,
    ROUND(SUM(sales), 3) AS TotalSales
FROM
    sales
GROUP BY
    city
ORDER BY
    TotalSales ASC
LIMIT 1;

-- 9 top 3 city with most revenue
SELECT
    city,
    ROUND(SUM(sales), 3) AS TotalSales
FROM
    sales
GROUP BY
    city
ORDER BY
    TotalSales desc
LIMIT 3;

