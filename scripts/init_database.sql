/*
================================================================================================================================
Create Database Database and Schemas
================================================================================================================================
Script Purpose:
	This script creates a new database named 'DataWarehouse' after checking if it already exists.
	If the database exists, it will be dropped and recreated. Additionally, the script sets up three schemas whithin the database:

	10-bronze
	20-silver
	30-gold

WARNING!!!
	Running this script will drop the entire "DataWarehouse" database if it exists.
	All data in the database will be permanently deleted.
	Proceed with caution and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Force the 'DataWarehouse' database into SINGLE_USER mode
    -- This ensures that only one session (yours) can access it
    -- WITH ROLLBACK IMMEDIATE will roll back any other open transactions and disconnect other users
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Now that it's in SINGLE_USER mode and all users are disconnected, you can safely drop the database
    DROP DATABASE DataWarehouse;
END;

-- Create the 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA "10-bronze";
GO
CREATE SCHEMA "20-silver";
GO
CREATE SCHEMA "30-gold";
