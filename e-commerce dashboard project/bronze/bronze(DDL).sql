-- ***************************
-- DDL for source
-- ***************************
USE bronze;
CREATE TABLE source (
orderid VARCHAR(50),
date DATE,
customerid VARCHAR(50),
product VARCHAR(50),
quantity INT,
unitprice DECIMAL(10,2),
shpping_address VARCHAR(50),
paymeny_method VARCHAR(50),
orderstatus VARCHAR(50),
tracking_number VARCHAR(50),
items_in_cart INT,
coupon_code VARCHAR(50),
referral_source VARCHAR(50),
total_price DECIMAL(20,2)
);
