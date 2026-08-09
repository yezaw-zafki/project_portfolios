SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
-- /Users/yezawmyint/My Project/E-commerce (decodelab)/Dataset for Data Analytics.csv

-- clear old data
TRUNCATE TABLE bronze.source;

-- load CSV file
LOAD DATA LOCAL INFILE '/Users/yezawmyint/My Project/E-commerce (decodelab)/Dataset for Data Analytics.csv'
INTO TABLE bronze.source
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
END $$
DELIMITER ;
