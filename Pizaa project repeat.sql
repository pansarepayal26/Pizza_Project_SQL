create database pizza;
use pizza;
select * from ps1;

#Q1 TOTAL REVENUE
select round(sum(`total_price`),2) as `total revenue` from ps1;

#Q2 AVG ORDER VALUE 
select sum(total_price)/count(distinct(order_id)) as `avg_order value` from ps1;

#Q3 TOTAL PIZZA SOLD
select sum(quantity) as `total pizzas sold` from ps1;

#Q4 TOTAL ORDERS
select count(distinct(order_id)) as `total orders` from ps1;

#Q5 AVG PIZZA PER ORDER
select sum(quantity)/count(distinct(order_id)) as `avg_order value` from ps1;

#Q6 % OF SALES BY PIZZA CATEGORY
select pizza_category,round(sum(total_price),2) as `total revenue`,
round(sum(total_price)*100/(select sum(total_price) from ps1),2) as pctg
from ps1
group by pizza_category;

#Q7 total pizzas sold by category
select pizza_category, sum(quantity) as total_qty_sold
from ps1
group by pizza_category
order by total_qty_sold desc; #to get ans by qty and to get and by category put pizza category here which gives and alphabatically

#top 5 pizzas by total revenue
select pizza_name, sum(total_price) as total_revenue
from ps1
group by pizza_name
order by total_revenue desc
limit 5;

#bottom 5 pizzas by total revenue
select pizza_name, sum(total_price) as total_revenue
from ps1
group by pizza_name
order by total_revenue
limit 5;

#top 5 pizzas by qty
select pizza_name, sum(quantity) as total_qty
from ps1
group by pizza_name
order by total_qty desc
limit 5;

#bottom 5 pizzas by qty
select pizza_name, sum(quantity) as total_qty
from ps1
group by pizza_name
order by total_qty
limit 5;

#top 5 pizzas by order id
select pizza_name, count(distinct(order_id)) as total_orders
from ps1
group by pizza_name
order by total_orders desc
limit 5;

#bottom 5 pizzas by order id
select pizza_name, count(distinct(order_id)) as total_orders
from ps1
group by pizza_name
order by total_orders
limit 5;

#% of sales by pizza size
select pizza_size,round(sum(total_price),2) as `total revenue`,
round(sum(total_price)*100/(select sum(total_price) from ps1),2) as pctg
from ps1
group by pizza_size;