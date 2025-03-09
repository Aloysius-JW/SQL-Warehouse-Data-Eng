--Using the appropriate config
USE ROLE role_main;
USE WAREHOUSE WH_1;
USE DATABASE DB_MAIN;
USE SCHEMA BRONZE;

--Creating file format here. This project is mostly CSV
CREATE OR REPLACE file format csv_format
TYPE = 'CSV'
FIELD_DELIMITER = ','
RECORD_DELIMITER = '\n'
SKIP_HEADER = 1;

--Here, we create the stage for the first table. Afterwards, the data is uploaded into this stage using snowsight UI
CREATE OR REPLACE STAGE crm_cust_info_stage;
CREATE OR REPLACE STAGE crm_prd_info_stage;
CREATE OR REPLACE STAGE crm_sales_details_stage;


--Create the tables needed
CREATE OR REPLACE TABLE crm_cust_info 
(
    cst_id INT,
    cst_key TEXT,
    cst_firstname TEXT,
    cst_lastname TEXT,
    cst_marital_status TEXT,
    cst_gndr TEXT,
    cst_create_date DATE
);

CREATE OR REPLACE TABLE crm_prd_info 
(
    prd_id INT,
    prd_key TEXT,
    prd_nm TEXT,
    prd_cost float,
    prd_line TEXT,
    prd_start_dt DATE,
    prd_end_dt DATE
);

CREATE OR REPLACE TABLE crm_sales_details 
(
    sls_ord_num TEXT,
    sls_prd_key TEXT,
    sls_cust_id INT,
    sls_order_dt TEXT,
    sls_ship_dt TEXT,
    sls_due_dt TEXT,
    sls_sales FLOAT,
    sls_quantity INT,
    sls_price FLOAT
);





