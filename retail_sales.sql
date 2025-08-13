select * from retail.customers;

SELECT *FROM retail.sales;

1.	What is the total revenue generated

SELECT 
	 sum(quantity*price) AS Total_revenue
from
	retail.sales;

2.	What is the most popular product category in terms of sales?

SELECT 
	 category,sum(quantity*price) AS Total_revenu

FROM retail.sales

GROUP BY category

order by total_revenu DESC

LIMIT 1;

3.	What are the three top shopping malls in terms of sales revenue?

SELECT
	sum(quantity*price) as Sales_revenu, shopping_mall

FROM retail.sales

Group by shopping_mall

ORDER BY sales_revenu desc

LIMIT 3;



4.	What is the gender distribution across different product categories?

select DISTINCT 
	RC.gender, RS.category

from retail.sales AS RS

JOIN retail.customers AS RC ON RS.customer_id=RC.customer_id

ORDER BY  rs.category;

--OR


select DISTINCT 
	RC.gender, RS.category, count(rc.customer_id) as customer_number

from retail.sales AS RS

JOIN retail.customers AS RC ON RS.customer_id=RC.customer_id

GROUP BY rc.gender,rs.category

ORDER BY customer_number DESC;





