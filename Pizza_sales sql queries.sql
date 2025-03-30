create database pizza_sales;
# KPI Requirement

-- Total Revenue
select sum(total_price) as Total_revenue
from pizza_sales;

-- Total Pizzas sold
select sum(quantity) as Total_Pizzas_sold
from pizza_sales;

-- Average Order value
select sum(total_price) / count(distinct(order_id)) as avG_order_value
from pizza_sales;

-- Total orders placed
select count(distinct(order_id)) as Total_orders
from pizza_sales;

-- Average number of pizzas per order
select round(sum(quantity) / count(distinct(order_id)),2) as avg_pizzas_per_order
from pizza_sales;

-- Daily Trend for total orders
SELECT 
    DAYNAME(order_date) AS dayname, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY dayname
ORDER BY FIELD(DAYNAME(order_date), 
    'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

-- Monthly Trend for total orders
SELECT 
    MONTHNAME(order_date) AS month_name, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date), MONTH(order_date)  -- Ensures correct sorting
ORDER BY MONTH(order_date);  -- Sorts by month number

-- Percentage of sales by pizza category
select pizza_category, round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as PCTS_category
from pizza_sales
group by pizza_category;

-- Percentage of sales by pizza size
select pizza_size, round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as PCTS_size
from pizza_sales
group by pizza_size;

-- Total pizzas sold by pizza category
 select pizza_category, sum(quantity) as Pizzas_sold
 from pizza_sales
 group by pizza_category;

-- Top 5 pizzas by total revenue
select pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue desc
limit 5;

-- Bottom 5 pizzas by total revenue
select pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by Total_revenue asc
limit 5;

-- Top 5 pizzas by total Quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity desc
limit 5;

-- Bottom 5 pizzas by total Quantity
select pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by Total_quantity 
limit 5;

-- Top 5 pizzas by total orders
select pizza_name, sum(distinct(order_id)) as total_orders
from pizza_sales
group by pizza_name
order by Total_orders desc
limit 5;

-- Bottom 5 pizzas by total Quantity
select pizza_name, sum(distinct(order_id)) as total_orders
from pizza_sales
group by pizza_name
order by Total_orders
limit 5;

