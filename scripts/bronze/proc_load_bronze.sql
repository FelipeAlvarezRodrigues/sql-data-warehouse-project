/*
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===========================================================================
Script Purpose:
	This stored procedure loads data into the "bronze" schema from external CSV files.
	It performs the following actions:
		- Truncates the bronze tables before loading data.
		- Use "BULK INSERT" command to load data from CSV files to bronze tables.
PARAMETERS:
	None.
		- This stored procedure does not accept any parameters or returen any values.
USAGE:
	EXEC bronze.load_bronze;
*/
	
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT 'Loading Bronze Layer...';
		PRINT '----------------------------------------------------';
		PRINT 'Loading CRM Tables...';
		PRINT '----------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>>Truncating table: bronze.crm_cust_info ';
		TRUNCATE TABLE bronze.crm_cust_info;
	
		PRINT '>>Inserting Data Into: bronze.crm_cust_info ';
		BULK INSERT bronze.crm_cust_info
		FROM '/mnt/dwh_project/datasets/source_crm/cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>>Truncating table: bronze.crm_prd_info ';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>>Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM '/mnt/dwh_project/datasets/source_crm/prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>>Truncating table: crm_sales_details ';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>>Inserting Data Into: crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM '/mnt/dwh_project/datasets/source_crm/sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------';

		PRINT 'Loading ERP Tables...';
		PRINT '----------------------------------------------------';
	
		SET @start_time = GETDATE();
		PRINT '>>Truncating table: bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
		PRINT '>>Inserting Data Into: bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM '/mnt/dwh_project/datasets/source_erp/CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>>Truncating table: bronze.erp_LOC_A101';
		TRUNCATE TABLE bronze.erp_LOC_A101;
		PRINT '>>Inserting Data Into: bronze.erp_LOC_A101';
		BULK INSERT bronze.erp_LOC_A101
		FROM '/mnt/dwh_project/datasets/source_erp/LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>>Truncating table: bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
		PRINT '>>Inserting Data Into: bronze.erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM '/mnt/dwh_project/datasets/source_erp/PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------';
		
		SET @batch_end_time = GETDATE();
		PRINT 'Loading Bronze Layer is Completed.';
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds' ;
	END TRY
	BEGIN CATCH    -- If trere is any error during "TRY" the second session will be executed "CATCH"
	PRINT '====================================================';
	PRINT 'ERROR OCURRED DURING DURING LOADING BRONZE LAYER';
	PRINT 'Error Message' + ERROR_MESSAGE();
	PRINT 'Error Number' + CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'Error State' + CAST (ERROR_STATE() AS NVARCHAR);
	PRINT '====================================================';
	END CATCH
END
