/*
SILVER LAYER for cleaning data
*/

USE silver;
-- clear old data
DROP TABLE IF EXISTS silver.clean_source;

-- load new data with transformation & clean
CREATE TABLE clean_source
SELECT 
	orderid,
	DATE_FORMAT(date, '%d-%m-%Y') date,
	customerid,
	product,
	quantity,
	round(unitprice,2) unitprice,
	TRIM(shipping_address) shipping_address,
	CASE WHEN payment_method='Cash' THEN 'Cash'
		ELSE 'Online' END paymenth_method,
	order_status,
	tracking_number,
	items_in_cart,
	CASE WHEN coupon_code='' THEN 'N/A'
		ELSE coupon_code
		END coupon_code,
	referral_source,
	round(total_price,2) total_price
FROM 
(
SELECT 
*
FROM bronze.source
)t;
