--Using the appropriate config
USE ROLE role_main;
USE WAREHOUSE WH_1;
USE DATABASE DB_MAIN;
USE SCHEMA BRONZE;

list @bronze_stage;

--Creating a stored procedure for loading data from stage into individual tables
CREATE or REPLACE procedure bronze_load() 
returns string
as
BEGIN

--Copy from stage to tables
TRUNCATE TABLE crm_cust_info;
TRUNCATE TABLE crm_prd_info;
TRUNCATE TABLE crm_sales_details;
TRUNCATE TABLE erp_cust_az12;
TRUNCATE TABLE erp_loc_a101;
TRUNCATE TABLE erp_px_cat_g1v2;

COPY INTO crm_cust_info
FROM @bronze_stage/CRM/cust_info
File_format = csv_format;

COPY INTO crm_prd_info
FROM @bronze_stage/CRM/prd_info
File_format = csv_format;

COPY INTO crm_sales_details
FROM @bronze_stage/CRM/sales_details
File_format = csv_format;

COPY INTO erp_cust_az12
FROM @bronze_stage/ERP/CUST_AZ12
File_format = csv_format;

COPY INTO erp_loc_a101
FROM @bronze_stage/ERP/LOC_A101
File_format = csv_format;

COPY INTO erp_px_cat_g1v2
FROM @bronze_stage/ERP/PX_CAT_G1V2
File_format = csv_format;

END;

-- Calling the stored procedures
call bronze_load();

--Check Data quality if anything is wrong
Select * from crm_cust_info;
Select * from crm_prd_info;
Select * from crm_sales_details;
Select * from erp_cust_az12;
Select * from erp_loc_a101;
Select * from erp_px_cat_g1v2;


