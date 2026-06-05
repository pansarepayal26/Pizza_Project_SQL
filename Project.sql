create database project;
use project;
select * from ps;

#Q1. TOTAL REVENUE
select round(sum(total_price),2) as 'total revenue' from ps;  #ANS: 817860

#Q2. AVERAGE ORDER VALUE 
select sum(total_price)/count(distinct order_id) as avg_order_value from ps; #38.30 #price/qty

#Q3. TOTAL PIZZAS SOLD
select sum(quantity) as total_pizzas_sold from ps; #49574

#Q4. TOTAL ORDERS
select count(distinct order_id) as total_orders from ps; #21350

#Q5. AVERAGE PIZZAS PER ORDER
select sum(quantity)/count(distinct order_id) as avg_pizzas_per_order from ps; #2.32

#Q6. PERCENTAGE OF SALES BY CATEGORY
select `pizza_category`,sum(total_price) as `total revenue`,
sum(total_price)*100/(select sum(total_price) as total_revenue from ps) as `%sales by pizza category` from ps
group by `pizza_category`;

#select sum(total_price) as total_revenue from ps; #total revenue is used in the above query as denominator

#Q7. TOTAL PIZZAS SOLD BY CATEGORY
select `pizza_category`,
sum(quantity) as total_pizzas_sold_by_category from ps
group by `pizza_category`;

#Q8. BOTTOM 5 PIZZAS BY QUANTITY
select * from ps
order by quantity
limit 5;

#Q9 TOP 5 PIZZAS BY QUANTITY
select * from ps
order by quantity desc
limit 5;

#Q10 BOTTOM 5 BY REVENUE
select * from ps
order by total_price 
limit 5;

#Q11 TOP 5 BY REVENUE
select * from ps
order by total_price desc
limit 5;

#Q12 TOP 5 BY TOTAL ORDERS
select pizza_name,count(distinct order_id) as total_orders from ps
group by pizza_name
order by total_orders desc
limit 5;

#Q13 BOTTOM 5 BY TOTAL ORDERS
select pizza_name,count(distinct order_id) as total_orders from ps
group by pizza_name
order by total_orders
limit 5;

#Q14 PERCENTAGE OF SALES BY PIZZA SIZE
select `pizza_size`,sum(total_price) as  `total revenue`,
(sum(total_price)*100/(select sum(total_price) as total_revenue from ps)) as `%sales by pizza size` from ps
group by `pizza_size`;

#Q15 DAILY TREND FOR TOTAL ORDERS
select dayname(str_to_date(order_date, '%d-%m-%y')) as `order day`,
count(distinct order_id) as total_orders from ps
group by `order day`
order by total_orders
desc;

#Q16 
select monthname(str_to_date(order_date, '%d-%m-%y')) as `order month`,
count(distinct order_id) as total_orders from ps
group by `order month`
order by total_orders
desc;