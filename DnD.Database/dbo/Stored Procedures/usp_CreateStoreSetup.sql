


CREATE PROCEDURE [dbo].[usp_CreateStoreSetup]
/*****************************************************************************************************************
FUNCTION:	[usp_CreateStoreSetup]
PURPOSE:	Create store setup.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreSetup [StoreSetup] READONLY
)
AS
BEGIN
	SET XACT_ABORT ON

	BEGIN TRANSACTION StoreSetup

	BEGIN TRY 
	DECLARE @StoreSetupTable [StoreSetup]
	DECLARE @IsActive BIT = 1;
	DECLARE @StoreId INT

	INSERT INTO @StoreSetupTable
	SELECT * FROM @StoreSetup

	--Insert Store 

	INSERT INTO [dbo].[Store]
           ([StoreName]
           ,[StoreURL]
           ,[IsActive]
           ,[CreatedBy]
           ,[CreatedOn]
		   ,[UpdatedBy]
		   ,[UpdatedOn])
     SELECT [StoreName],[StoreURL],@IsActive,CreatedBy,CreatedOn,CreatedBy,CreatedOn FROM @StoreSetupTable


	 SELECT @StoreId = IDENT_CURRENT('Store');

	 IF(@StoreId IS NOT NULL)
	 BEGIN
			-- Store
			INSERT INTO [dbo].[SetupGeneralStoreSettings]
			   ([StoreId]
			   ,[StoreName]
			   ,[StorePrivateURL]
			   ,[DefaultCurrencyId]
			   ,[TimeZoneId]			   			   			   
			   ,[IsActive]
			   ,[CreatedBy]
			   ,[CreatedOn]
			   ,[UpdatedBy]
			   ,[UpdatedOn])
			SELECT 
				@StoreId,[StoreName],[StoreURL],[DefaultCurrencyId],[TimeZoneId]
				,@IsActive, CreatedBy,CreatedOn , CreatedBy,CreatedOn
			FROM @StoreSetupTable

			--Contact
			INSERT INTO [dbo].[SetupContactInformation]
           ([StoreId]
           ,[ContactFirstName]
           ,[ContactLastName]
           ,[Email]
           ,[PhoneNumber]
           ,[Website]
           ,[TwitterHandle]
		   ,[FaceBook]
		   ,[LinkedIn]
           ,[IsActive]
           ,[CreatedBy]
           ,[CreatedOn]
		   ,[UpdatedBy]
		   ,[UpdatedOn])
		   SELECT 
				@StoreId,[ContactFirstName],[ContactLastName],[Email],[PhoneNumber],[Website],[TwitterHandle],[FaceBook],[LinkedIn],@IsActive, CreatedBy,CreatedOn , CreatedBy,CreatedOn 
			FROM @StoreSetupTable

			--OTHER

			INSERT INTO [dbo].[SetupOtherStoreSettings]
           ([StoreId]
           ,[DisplayPricesId]
           ,[SKUGenerationId]
           ,[UserSwitchingSecurityId]
           ,[IsDiscountAllowedOnReceipt]
           ,[IsOutOfStockEmailNotificationAllowed]
           ,[IsTipsOrSurchargeAllowed]
           ,[IsLaybyAllowed]
           ,[IsOnAccountSaleAllowed]
           ,[IsActive]
           ,[CreatedBy]
           ,[CreatedOn]
		   ,[UpdatedBy]
		   ,[UpdatedOn])

		   SELECT 
				@StoreId,[DisplayPricesId],[SKUGenerationId],[UserSwitchingSecurityId],
				[IsDiscountAllowedOnReceipt],[IsOutOfStockEmailNotificationAllowed],
				[IsTipsOrSurchargeAllowed],[IsLaybyAllowed],[IsOnAccountSaleAllowed],@IsActive, CreatedBy,CreatedOn , CreatedBy,CreatedOn
			FROM @StoreSetupTable

			--Address 
			INSERT INTO [dbo].[SetupStoreAddress]
           ([StoreId]
           ,[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddressSameAsPhysicalAddress]
           ,[PostalAddressStreet1]
           ,[PostalAddressStreet2]
           ,[PostalSuburb]
           ,[PostalCity]
           ,[PostalPostCode]
           ,[PostalState]
           ,[PostalCountryId]
           ,[IsActive]
           ,[CreatedBy]
           ,[CreatedOn]
		   ,[UpdatedBy]
		   ,[UpdatedOn])
		   SELECT 
			@StoreId,
			[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddressSameAsPhysicalAddress]
           ,[PostalAddressStreet1]
           ,[PostalAddressStreet2]
           ,[PostalSuburb]
           ,[PostalCity]
           ,[PostalPostCode]
           ,[PostalState]
           ,[PostalCountryId]
			,@IsActive 
			,CreatedBy
			,CreatedOn
			,CreatedBy
			,CreatedOn 
			FROM @StoreSetupTable



	 END

	 END TRY
	 BEGIN CATCH
		SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
		WHILE(@@trancount > 0)
		   BEGIN
			  rollback transaction
		   END
	 END CATCH
	 IF (@@trancount <> 0)
		BEGIN
		   COMMIT TRANSACTION StoreSetup;
		END
END