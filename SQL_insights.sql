SELECT * FROM sales.transactions;

-- Number of transation made 
select count(*) from sales.transactions;

-- Total number of customers 
select count(*) from sales.customers;

-- transation made in the perticular area, here Mark001 is for the chennai 
select * from transactions where market_code = "Mark001";

-- number of transation in Chennai 
select count(*) from transactions where market_code = "Mark001";

-- transations where the currency is USD
select * from transactions where currency = "USD";

-- displaying the transations made in the year 2020, approach -> joining the date table with transation table to get the desire result 
SELECT sales.transactions.*, sales.date.* 
FROM transactions 
INNER JOIN sales.date 
ON 
sales.transactions.order_date = sales.date.date 
WHERE sales.date.year = 2020;

-- Sum of the total sale made in the year 2020 from the transation table
SELECT SUM(transactions.sales_amount) 
FROM transactions
INNER JOIN date
ON
transactions.order_date = date.date
WHERE date.year = 2020;

-- similarly in 2019
SELECT SUM(transactions.sales_amount) 
FROM transactions
INNER JOIN date
ON
transactions.order_date = date.date
WHERE date.year = 2019;

-- INSIGHT => as we see the sales were declining because the total sales in 2019 was nearly double from the year 2020

-- Lets see how much business we made in chennai in the year 2020

SELECT SUM(sales.transactions.sales_amount) 
FROM sales.transactions
INNER JOIN date
ON
sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020 AND sales.transactions.market_code = "Mark001";

-- distinct products sold in chennai
 SELECT distinct product_code FROM transactions WHERE transactions.market_code="Mark001";