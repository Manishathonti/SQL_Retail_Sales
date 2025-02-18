--Data Cleaning--

DELETE from retail_sales
where transactions_id is null
      or sale_date is null
	  or sale_time is null
	  or customer_id is null
	  or gender is null
	  or category is null
	  or quantity is null
	  or price_per_unit is null
	  or cogs is null
	  or total_sale is null
	  
--Data Analysis--

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30'
  AND quantity >= 4;

SELECT category,
     sum(total_sale),
	 count(*)as total_orders
FROM retail_sales
group by category;

SELECT category,avg(age)
FROM retail_sales
WHERE category = 'Beauty'
group by 1;

SELECT *
FROM retail_sales
WHERE total_sale >1000;

SELECT gender, category, count(transactions_id)
FROM retail_sales
group by gender,category;

SELECT EXTRACT(year from sale_date)as year,
       EXTRACT(month from sale_date)as month,
	   avg(total_sale) as avg_sale
FROM retail_sales
group by year,month
order by avg_sale desc,year,month
limit 2;

SELECT customer_id,
        sum(total_sale) as total_sales
FROM retail_sales
group by customer_id
order by total_sales desc
limit 5;

SELECT category,count(distinct(customer_id)) AS unique_id
FROM retail_sales
group by 1;


SELECT 
       CASE
	when extract(hour from sale_time) <= 12 then 'morning'
	when extract(hour from sale_time) between 12 and 17 then 'afternoon'
	else 'evning' 
       END as shift,
       count(transactions_id) as num_orders
FROM retail_sales
GROUP BY shift;

	   
	   
	   



   
