/* join transactions and date table on dates columns*/
SELECT 
sales.transactions.*, sales.date.*
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;  /*only select years 2020 sales*/

/* total sales for specific year*/
SELECT 
SUM(sales.transactions.sales_amount) AS total_sales
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2019; /* change to specific year*/

/* total sales for specific year and market*/
SELECT 
SUM(sales.transactions.sales_amount) AS total_sales
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2019 AND sales.transactions.market_code = 'Mark002'; /* change to specific year AND markets_code*/

/* average sales by year*/
SELECT 
sales.date.year, SUM(sales.transactions.sales_amount) AS total_sales
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
GROUP BY sales.date.year;

/* average sales by year*/
SELECT 
sales.date.year, AVG(sales.transactions.sales_amount) AS average_sales
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
GROUP BY sales.date.year;

/* unique product sales for specific market*/
SELECT distinct product_code
FROM sales.transactions 
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.transactions.market_code = 'Mark002'; /* change to specific markets_code*/

/* total sales qty and total sales amount by customer name and customer type*/
SELECT 
	sales.customers.custmer_name, sales.customers.customer_type, SUM(sales.transactions.sales_qty) AS total_sales_qty, SUM(sales.transactions.sales_amount) AS total_sales_amount
FROM sales.transactions
INNER JOIN sales.customers ON sales.transactions.customer_code = sales.customers.customer_code
WHERE currency <> 'USD'
GROUP BY custmer_name
ORDER BY customer_type;
