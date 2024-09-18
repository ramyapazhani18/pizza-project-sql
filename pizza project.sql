select * from pizza_sales

---Total revenue
select sum(total_price) as total_revenue from pizza_sales

--Average Order Value
select sum(total_price)/count(distinct order_id) as avg_order from pizza_sales

--Total pizzas sold
select sum(quantity) as ttl_pizzas_sold from pizza_sales

--Total order
select count(distinct order_id) as ttl_order from pizza_sales

--Average pizza per order

select cast(sum(quantity) as decimal (10,2))/cast(count(distinct order_id) as decimal (10,2)) as avg_pizza_per_order from pizza_sales

--Daily trend for total orders

select DATENAME(DW,order_date) as order_day, count(distinct order_id) from pizza_sales group by DATENAME(DW,order_date)

--Monthly trend for total orders

select datename(month,order_date) as order_date,
count(distinct(order_id) ) as month_orders
from 
pizza_sales
group by 
datename(month,order_date)

--Percentage of sales by pizza category

select pizza_category,
sum(total_price) *100/(select sum(total_price) from pizza_sales) as percent_of_sales
from pizza_sales 
group by
pizza_category

--percentage of sales by pizza_sales

select pizza_size,
sum(total_price) *100/(select sum(total_price) from pizza_sales) as percent_of_sales
from pizza_sales 
group by
	pizza_size

--top 5 pizza_name  by revenue


select top 5
pizza_name,
sum(total_price) as revenue
from pizza_sales
group by
pizza_name
order by
 revenue desc

 --Bottom 5 pizzas by Revenue

 select top 5
pizza_name,
sum(total_price) as revenue
from pizza_sales
group by
pizza_name
order by
 revenue 

 --Top 5 pizzas by Quantity

  select top 5
pizza_name,
sum(quantity) as quantity
from
pizza_sales
group by
pizza_name
order by 
quantity desc

-- bottom 5 pizzas by quantity

  select top 5
pizza_name,
sum(quantity) as quantity
from
pizza_sales
group by
pizza_name
order by 
quantity asc

--top 5 pizzas by total orders

  select top 5
pizza_name,
count(distinct order_id) as total_orders
from
pizza_sales
group by
pizza_name
order by 
total_orders desc

-- bottom 5 pizas by total orders
  select top 5
pizza_name,
count(distinct order_id) as total_orders
from
pizza_sales
group by
pizza_name
order by 
total_orders 



