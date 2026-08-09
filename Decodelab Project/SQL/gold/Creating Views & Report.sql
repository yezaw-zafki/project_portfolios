USE gold;

-- ****************
-- separate views
-- ****************
-- Drop & Recreate Views
DROP VIEW IF EXISTS source;
DROP VIEW IF EXISTS sales;
DROP VIEW IF EXISTS analysis;

CREATE VIEW source AS(
SELECT * FROM silver.clean_source
);

CREATE VIEW sales AS (
SELECT 
*
FROM silver.clean_source
WHERE order_status='Delivered');

CREATE VIEW analysis AS(
SELECT
*
FROM silver.clean_source
WHERE order_status!='Delivered');

-- ****************
-- report generating
-- ****************
-- Customers report
SELECT
	customerid,
    return_count,
	CONCAT(total_spending,' $'),
	ROW_NUMBER() OVER() spending_rank,
	CASE WHEN customer_rank<=0.30 THEN 'VIP'
	ELSE 'Normal'
	END class,
    coupon_code,
    referral_source,
    shipping_address
FROM(
SELECT
	customerid,
    COUNT(*) return_count,
    order_status,
	SUM(total_price) total_spending,
	PERCENT_RANK() OVER(ORDER BY SUM(total_price) DESC) customer_rank,
    coupon_code,
    referral_source,
    shipping_address
FROM silver.clean_source
WHERE order_status='Delivered'
GROUP BY customerid,coupon_code,referral_source,shipping_address) t;

-- Sales report
SELECT
	year,
	product,
	total_delivered,
	CONCAT(average_price,' $'),
	total_in_cart,
	CONCAT(total_sales,' $'),
	RANK() OVER(PARTITION BY year ORDER BY percent_sales DESC, year DESC) product_rank,
	percent_sales,
	turn_over_rate
FROM(
SELECT
	year(date) year,
	product,
	SUM(quantity) total_delivered,
	SUM(items_in_cart) total_in_cart,
	ROUND(AVG(unitprice),2) average_price,
	SUM(total_price) total_sales,
	CONCAT(ROUND(SUM(total_price) * 100.0 / SUM(SUM(total_price)) OVER (), 2),' %') AS percent_sales,
	CONCAT(ROUND(SUM(quantity)/SUM(items_in_cart),2),' %') turn_over_rate
FROM silver.clean_source
WHERE order_status='Delivered'
GROUP BY year,product) t
ORDER BY year DESC, product_rank ASC;

-- analysis report
SELECT 
	*,
	CONCAT(ROUND(order_count*100/ SUM(order_count) OVER (PARTITION BY product,year),2),' %') AS percent_status_by_product
FROM (
SELECT
	year(date) year,
	product,
	order_status,
	COUNT(*) AS order_count
FROM silver.clean_source
GROUP BY year,product, order_status) t
ORDER BY year DESC,product,FIELD(order_status,'Delivered','Shipped','Pending','Cancelled','Returned');

-- summary report
SELECT
year(date) year,
COUNT(customerid) active_customers,
CONCAT(SUM(total_price),' $') revenue_per_year
FROM silver.clean_source
WHERE order_status='Delivered'
GROUP BY year
ORDER BY year DESC;
