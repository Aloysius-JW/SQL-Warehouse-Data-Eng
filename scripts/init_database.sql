/*
Script Purpose:
This is used to create warehouse WH_1, Database db_main and role_main. They are used to create 3 schemas 'bronze', 'silver' and 'gold' afterwards. 


WARNING:
This script will drop existing warehouse and database of the same name before recreating them. This means that the current information will be lost if this script is used. 
Back up data as needed and proceed with caution,
*/

--Restarting the warehouse and the database
USE ROLE accountadmin;
DROP WAREHOUSE IF EXISTS WH_1;
DROP DATABASE IF EXISTS db_main;
--Setting up the new warehouse, roles, database and schema
CREATE WAREHOUSE IF NOT EXISTS Wh_1 WITH warehouse_size = "x-small";
CREATE DATABASE IF NOT EXISTS db_main;
CREATE ROLE IF NOT EXISTS role_main;
--Checking the privilege the roles have on this warehouse
SHOW GRANTS ON WAREHOUSE wh_1;
--Giving privilege to the new role
GRANT usage ON WAREHOUSE wh_1 TO ROLE role_main;
GRANT ROLE role_main to user aloyjw;
GRANT ALL ON database db_main TO ROLE role_main;
--Use the role and create schema nb
USE ROLE role_main;
--Creating the bronze, silver, gold schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
