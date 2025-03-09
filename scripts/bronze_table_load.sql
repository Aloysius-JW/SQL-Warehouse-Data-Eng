--Using the appropriate config
USE ROLE role_main;
USE WAREHOUSE WH_1;
USE DATABASE DB_MAIN;
USE SCHEMA BRONZE;

--Creating a stored procedure for loading data from stage into individual tables
CREATE or REPLACE procedure bronze_load() 
returns string
as
BEGIN
--Copy from stage to tables
TRUNCATE TABLE crm_cust_info;
TRUNCATE TABLE crm_prd_info;
TRUNCATE TABLE crm_sales_details;

COPY INTO crm_cust_info
FROM @crm_cust_info_stage
File_format = csv_format;

COPY INTO crm_prd_info
FROM @crm_prd_info_stage
File_format = csv_format;

COPY INTO crm_sales_details
FROM @crm_sales_details_stage
File_format = csv_format;
END;

-- Calling the stored procedures
call bronze_load();

--Check Data quality if anything is wrong
Select * from crm_cust_info;
Select * from crm_prd_info;
Select * from crm_sales_details;
