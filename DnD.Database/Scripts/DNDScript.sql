USE [master]
GO
/****** Object:  Database [DND]    Script Date: 1/27/2018 4:48:25 PM ******/
CREATE DATABASE [DND] ON  PRIMARY 
( NAME = N'DND', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\DND.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DND_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\DND_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DND] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DND].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DND] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DND] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DND] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DND] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DND] SET ARITHABORT OFF 
GO
ALTER DATABASE [DND] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DND] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DND] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DND] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DND] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DND] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DND] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DND] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DND] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DND] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DND] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DND] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DND] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DND] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DND] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DND] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DND] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DND] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DND] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DND] SET  MULTI_USER 
GO
ALTER DATABASE [DND] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DND] SET DB_CHAINING OFF 
GO
USE [DND]
GO
/****** Object:  UserDefinedTableType [dbo].[CustomerType]    Script Date: 1/27/2018 4:48:26 PM ******/
CREATE TYPE [dbo].[CustomerType] AS TABLE(
	[CustomerId] [int] NULL,
	[StoreId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Company] [nvarchar](100) NULL,
	[CustomerCode] [nvarchar](100) NULL,
	[CustomerGroupId] [int] NULL,
	[IsLoyaltyEnabled] [bit] NULL,
	[DateOfBirth] [datetime] NULL,
	[Sex] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[Twitter] [nvarchar](50) NULL,
	[IsCustomerOptedOutMail] [bit] NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[PhysicalSuburb] [nvarchar](100) NULL,
	[PhysicalCity] [nvarchar](100) NULL,
	[PhysicalPostcode] [nvarchar](50) NULL,
	[PhysicalState] [nvarchar](50) NULL,
	[PhysicalCountryId] [int] NULL,
	[IsPostalAddSameAsPhysicalAdd] [bit] NULL,
	[PostalAddressStree1] [nvarchar](200) NULL,
	[PostalAddressStreet2] [nvarchar](200) NULL,
	[PostalSuburb] [nvarchar](100) NULL,
	[PostalCity] [nvarchar](100) NULL,
	[PostalPostCode] [nvarchar](50) NULL,
	[PostalState] [nvarchar](50) NULL,
	[PostalCountryId] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StoreSetup]    Script Date: 1/27/2018 4:48:27 PM ******/
CREATE TYPE [dbo].[StoreSetup] AS TABLE(
	[StoreName] [nvarchar](100) NOT NULL,
	[StoreURL] [nvarchar](100) NULL,
	[DefaultCurrencyId] [int] NULL,
	[TimeZoneId] [int] NULL,
	[DisplayPricesId] [int] NULL,
	[SKUGenerationId] [int] NULL,
	[CurrentSequenceNumber] [nvarchar](100) NULL,
	[UserSwitchingSecurityId] [int] NULL,
	[IsDiscountAllowedOnReceipt] [bit] NULL,
	[IsOutOfStockEmailNotificationAllowed] [bit] NULL,
	[IsTipsOrSurchargeAllowed] [bit] NULL,
	[IsLaybyAllowed] [bit] NULL,
	[IsOnAccountSaleAllowed] [bit] NULL,
	[ContactFirstName] [nvarchar](100) NULL,
	[ContactLastName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Website] [nvarchar](50) NULL,
	[TwitterHandle] [nvarchar](50) NULL,
	[FaceBook] [nvarchar](50) NULL,
	[LinkedIn] [nvarchar](50) NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[PhysicalSuburb] [nvarchar](50) NULL,
	[PhysicalCity] [nvarchar](50) NULL,
	[PhysicalPostcode] [nvarchar](20) NULL,
	[PhysicalState] [nvarchar](50) NULL,
	[PhysicalCountryId] [int] NULL,
	[IsPostalAddressSameAsPhysicalAddress] [bit] NULL,
	[PostalAddressStreet1] [nvarchar](200) NULL,
	[PostalAddressStreet2] [nvarchar](200) NULL,
	[PostalSuburb] [nvarchar](50) NULL,
	[PostalCity] [nvarchar](50) NULL,
	[PostalPostCode] [nvarchar](20) NULL,
	[PostalState] [nvarchar](50) NULL,
	[PostalCountryId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateStoreSetup]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



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





GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteBrand]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteBrand]
PURPOSE:	Delete a Brand
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductBrandId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductBrand SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductBrandId = @ProductBrandId

	SELECT @ProductBrandId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteCustomer]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DeleteCustomer]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteCustomer]
PURPOSE:	Delete a Customer
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerId int,
@UpdatedBy int
)
AS
BEGIN

	Update  [dbo].[Customer] SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE CustomerId = @CustomerId

	SELECT @CustomerId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteGroup]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteGroup]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteGroup]
PURPOSE:	Delete a Group
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerGroupMasterId int,
@UpdatedBy int
)
AS
BEGIN

	Update  [dbo].[CustomerGroupMaster] SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE CustomerGroupMasterId = @CustomerGroupMasterId

	SELECT @CustomerGroupMasterId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProductType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteProductType]
PURPOSE:	Delete a ProductType
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductType SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductTypeId = @ProductTypeId

	SELECT @ProductTypeId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteSupplier]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteSupplier]
PURPOSE:	Delete a Supplier
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductSupplierId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductSupplier SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductSupplierId = @ProductSupplierId

	SELECT @ProductSupplierId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTag]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteTag]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteTag]
PURPOSE:	Delete a Tag
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTagId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductTag SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductTagId = @ProductTagId

	SELECT @ProductTagId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllBrandsByStore]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllBrandsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllBrands]
PURPOSE:	Get all brands of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT ProductBrandId, BrandName, BrandDescription, IsActive
	FROM ProductBrand
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllBrandsByStore 1
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllCustomersByGroup]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllCustomersByGroup]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllCustomersByGroup]
PURPOSE:	Get all customer for the given group.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerGroupMasterId int = null,
@CustomerId int = null
)
AS
BEGIN

	IF(@CustomerGroupMasterId IS NOT NULL)
	BEGIN
		Select 
	   c.[CustomerId]
      ,c.[StoreId]
      ,c.[FirstName]
      ,c.[LastName]
      ,c.[Company]
      ,c.[CustomerCode]
      ,c.[CustomerGroupId]
      ,c.[IsLoyaltyEnabled]
      ,c.[DateOfBirth]
      ,c.[Sex]
      ,c.[Phone]
      ,c.[Mobile]
      ,c.[Fax]
      ,c.[Email]
      ,c.[Website]
      ,c.[Twitter]
      ,c.[IsCustomerOptedOutMail]
      ,c.[PhysicalAddressStreet1]
      ,c.[PhysicalAddressStreet2]
      ,c.[PhysicalSuburb]
      ,c.[PhysicalCity]
      ,c.[PhysicalPostcode]
      ,c.[PhysicalState]
      ,c.[PhysicalCountryId]
      ,c.[IsPostalAddSameAsPhysicalAdd]
      ,c.[PostalAddressStree1]
      ,c.[PostalAddressStreet2]
      ,c.[PostalSuburb]
      ,c.[PostalCity]
      ,c.[PostalPostCode]
      ,c.[PostalState]
      ,c.[PostalCountryId]
      ,c.[IsActive]
      ,c.[CreatedBy]
      ,c.[CreatedOn]
      ,c.[UpdatedBy]
      ,c.[UpdatedOn]
	  ,cntry.CountryId
	  ,cntry.Name AS [CountryName]
		FROM [dbo].[Customer] c (NOLOCK)
		LEFT JOIN [Country] cntry (NOLOCK) ON cntry.CountryId = c.PhysicalCountryId
		Where c.IsActive = 1 and c.CustomerGroupId = ISNULL(@CustomerGroupMasterId,c.CustomerGroupId)
	END
	ELSE IF(@CustomerId IS NOT NULL)
	BEGIN
		Select
		c.[CustomerId]
      ,c.[StoreId]
      ,c.[FirstName]
      ,c.[LastName]
      ,c.[Company]
      ,c.[CustomerCode]
      ,c.[CustomerGroupId]
      ,c.[IsLoyaltyEnabled]
      ,c.[DateOfBirth]
      ,c.[Sex]
      ,c.[Phone]
      ,c.[Mobile]
      ,c.[Fax]
      ,c.[Email]
      ,c.[Website]
      ,c.[Twitter]
      ,c.[IsCustomerOptedOutMail]
      ,c.[PhysicalAddressStreet1]
      ,c.[PhysicalAddressStreet2]
      ,c.[PhysicalSuburb]
      ,c.[PhysicalCity]
      ,c.[PhysicalPostcode]
      ,c.[PhysicalState]
      ,c.[PhysicalCountryId]
      ,c.[IsPostalAddSameAsPhysicalAdd]
      ,c.[PostalAddressStree1]
      ,c.[PostalAddressStreet2]
      ,c.[PostalSuburb]
      ,c.[PostalCity]
      ,c.[PostalPostCode]
      ,c.[PostalState]
      ,c.[PostalCountryId]
      ,c.[IsActive]
      ,c.[CreatedBy]
      ,c.[CreatedOn]
      ,c.[UpdatedBy]
      ,c.[UpdatedOn]
	   ,cntry.CountryId
	  ,cntry.Name AS [CountryName]
		FROM [dbo].[Customer] c
		LEFT JOIN [Country] cntry (NOLOCK) ON cntry.CountryId = c.PhysicalCountryId
		Where c.IsActive = 1 and c.CustomerGroupId = ISNULL(@CustomerGroupMasterId,c.CustomerGroupId)
	END
	ELSE
	BEGIN
		Select 
		c.[CustomerId]
      ,c.[StoreId]
      ,c.[FirstName]
      ,c.[LastName]
      ,c.[Company]
      ,c.[CustomerCode]
      ,c.[CustomerGroupId]
      ,c.[IsLoyaltyEnabled]
      ,c.[DateOfBirth]
      ,c.[Sex]
      ,c.[Phone]
      ,c.[Mobile]
      ,c.[Fax]
      ,c.[Email]
      ,c.[Website]
      ,c.[Twitter]
      ,c.[IsCustomerOptedOutMail]
      ,c.[PhysicalAddressStreet1]
      ,c.[PhysicalAddressStreet2]
      ,c.[PhysicalSuburb]
      ,c.[PhysicalCity]
      ,c.[PhysicalPostcode]
      ,c.[PhysicalState]
      ,c.[PhysicalCountryId]
      ,c.[IsPostalAddSameAsPhysicalAdd]
      ,c.[PostalAddressStree1]
      ,c.[PostalAddressStreet2]
      ,c.[PostalSuburb]
      ,c.[PostalCity]
      ,c.[PostalPostCode]
      ,c.[PostalState]
      ,c.[PostalCountryId]
      ,c.[IsActive]
      ,c.[CreatedBy]
      ,c.[CreatedOn]
      ,c.[UpdatedBy]
      ,c.[UpdatedOn]
	  ,cntry.CountryId
	  ,cntry.Name AS [CountryName]
		 FROM [dbo].[Customer] c
		LEFT JOIN [Country] cntry (NOLOCK) ON cntry.CountryId = c.PhysicalCountryId
		Where c.IsActive = 1
	END
	



END
------------------------------------------------------------------------------------------------------------------
--[usp_GetAllCustomersByGroup] 1
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllGroups]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllGroups]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllGroups]
PURPOSE:	Get all groups for the customer.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
AS
BEGIN
	SELECT CustomerGroupMasterId, GroupName, DiscountPercentage, IsActive,CreatedOn
	FROM CustomerGroupMaster
	WHERE IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllGroups
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllMasterDataForCreateOrEditCustomer]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForCreateOrEditCustomer]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditCustomer]
PURPOSE:	Get Countries ,Group for customer.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
AS
BEGIN

	Select c.CountryId, c.Name as CountryName FROM [dbo].[Country] c (NOLOCK) WHERE c.IsActive = 1

	Select cg.CustomerGroupMasterId, cg.GroupName FROM [dbo].[CustomerGroupMaster] cg (NOLOCK) WHERE cg.IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForCreateOrEditCustomer
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllMasterDataForCreateOrEditProduct]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForCreateOrEditProduct]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditProduct]
PURPOSE:	Get all Product tags categories brands suppliers by store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN

	select Distinct TagName 
	from ProductTag where IsActive = 1 
	--and StoreId = @StoreId

	select ProductTypeId, ProductTypeName 
	from ProductType where IsActive = 1
	--and StoreId = @StoreId

	select ProductBrandId, BrandName, BrandDescription 
	from ProductBrand where IsActive = 1
	--and StoreId = @StoreId

	select ProductSupplierId, SupplierName, SupplierDefaultMarkup, Description 
	from ProductSupplier where IsActive = 1
	--and StoreId = @StoreId

	select StoreOutletId, OutletName, OutletDefaultSalesTaxId 
	from StoreOutlet where IsActive = 1
	--and StoreId = @StoreId

	select ProductVariantAttributeId, VariantAttributeName 
	from ProductVariantAttribute
	Where IsActive = 1

	select SalesTaxId, TaxName, TaxRate 
	from SalesTax Where IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForCreateOrEditProduct 1
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllMasterDataForStore]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditCustomer]
PURPOSE:	Get Countries ,Group for customer.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
AS
BEGIN

	Select c.CountryId, c.Name as CountryName FROM [dbo].[Country] c (NOLOCK) WHERE c.IsActive = 1

	SELECT [TimeZoneId],[DsiplayName],[StandardName],[HasDST],[UTCOffset] FROM [dbo].[TimeZone] tz (NOLOCK) WHERE tz.IsActive = 1

	Select dp.DisplayPriceId, dp.DisplayPriceName FROM [dbo].[DisplayPrice] dp (NOLOCK) WHERE dp.IsActive = 1

	Select UserSwitchingSecurityTypeId,UserSwitchingSecurityTypeName FROM [dbo].[UserSwitchingSecurityType] sc (NOLOCK) WHERE sc.IsActive = 1

	SELECT [SKUGenerationTypeId],[SKUGenerationName] FROM [dbo].[SKUGenerationType] sku (NOLOCK) WHERE sku.IsActive = 1

	SELECT CurrencyId,CurrencyName,CurrencySymbol FROM	[dbo].[Currency] (NOLOCK) WHERE IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForStore
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllProductsByStore]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllProductsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllProductsByStore]
PURPOSE:	Get all products of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	
	SELECT DISTINCT P.ProductName, P.ProductId, P.CreatedOn, 
	--PT.TagName, 
	PB.BrandName, PS.SupplierName, P.IsActive
	FROM Product P
	LEFT JOIN ProductBrand PB ON P.ProductBrandId = PB.ProductBrandId
	LEFT JOIN ProductSupplier PS ON P.SupplierId = PS.ProductSupplierId
	LEFT JOIN ProductTag PT ON P.ProductId = PT.ProductId
	WHERE P.IsActive = 1

	--Product Tags
	SELECT P.ProductId, PT.TagName
	FROM Product P
	INNER JOIN ProductTag PT ON P.ProductId = PT.ProductId
	WHERE P.IsActive = 1



END
------------------------------------------------------------------------------------------------------------------
--usp_GetAllProductsByStore 1
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllProductTypesByStore]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllProductTypesByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllProductTypes]
PURPOSE:	Get all ProductTypes of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT ProductTypeId, ProductTypeName, IsActive
	FROM ProductType
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllProductTypesByStore 1
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllSuppliersByStore]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllSuppliersByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllSuppliersByStore]
PURPOSE:	Get all brands of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT ProductSupplierId, SupplierName, SupplierDefaultMarkup, Description, Firstname, Lastname, 
	Company, Email, Phone, Mobile, Fax, Website, Twitter, AddressStreet1, AddressStreet2, Postcode, State, Country, 
	CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive
	FROM ProductSupplier
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllSuppliersByStore 1
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllTagsByStore]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllTagsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllTags]
PURPOSE:	Get all tags of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT Distinct TagName, ProductTagId, IsActive
	FROM ProductTag
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllTagsByStore 1
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetCountryList]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetCountryList]
/*****************************************************************************************************************
FUNCTION:	[usp_GetCountryList]
PURPOSE:	Get all countries.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
AS
BEGIN
	SELECT CountryId,Name FROM [dbo].[Country] Where IsActive = 1
	

END
------------------------------------------------------------------------------------------------------------------
--EXEC [usp_GetCountryList] 
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetCustomersBySearch]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetCustomersBySearch]
/*****************************************************************************************************************
FUNCTION:	[usp_GetCustomersBySearch]
PURPOSE:	Get all customer by search.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@SearchWord nvarchar(200)= null,
@CustomerGroupMasterId int = null,
@City nvarchar(200) = null,
@PostalCountryId int = null,
@CreatedOn nvarchar(200)= null 
)
AS
BEGIN
	
	SET @SearchWord = REPLACE(REPLACE(RTRIM(LTRIM(@SearchWord)),' ', ''),',','');

	SELECT 
	   c.[CustomerId]
      ,c.[StoreId]
      ,c.[FirstName]
      ,c.[LastName]
      ,c.[Company]
      ,c.[CustomerCode]
      ,c.[CustomerGroupId]
      ,c.[IsLoyaltyEnabled]
      ,c.[DateOfBirth]
      ,c.[Sex]
      ,c.[Phone]
      ,c.[Mobile]
      ,c.[Fax]
      ,c.[Email]
      ,c.[Website]
      ,c.[Twitter]
      ,c.[IsCustomerOptedOutMail]
      ,c.[PhysicalAddressStreet1]
      ,c.[PhysicalAddressStreet2]
      ,c.[PhysicalSuburb]
      ,c.[PhysicalCity]
      ,c.[PhysicalPostcode]
      ,c.[PhysicalState]
      ,c.[PhysicalCountryId]
      ,c.[IsPostalAddSameAsPhysicalAdd]
      ,c.[PostalAddressStree1]
      ,c.[PostalAddressStreet2]
      ,c.[PostalSuburb]
      ,c.[PostalCity]
      ,c.[PostalPostCode]
      ,c.[PostalState]
      ,c.[PostalCountryId]
      ,c.[IsActive]
      ,c.[CreatedBy]
      ,c.[CreatedOn]
      ,c.[UpdatedBy]
      ,c.[UpdatedOn]
	  ,country.CountryId
	  ,country.Name AS [CountryName] 
	FROM [dbo].[Customer] c (NOLOCK)
	JOIN [dbo].[Country] country (NOLOCK) ON c.PostalCountryId = country.CountryId
	WHERE 
	c.IsActive = 1
	AND
		@SearchWord is null or c.FirstName LIKE '%' + @SearchWord + '%'
	OR (@SearchWord is null or c.LastName LIKE '%' + @SearchWord + '%')
	OR (@SearchWord is null or c.CustomerCode LIKE '%' + @SearchWord + '%')
	OR (@SearchWord is null or c.Mobile LIKE '%' + @SearchWord + '%')
	OR (@SearchWord is null or c.Phone LIKE '%' + @SearchWord + '%')
	OR (@SearchWord is null or c.Fax LIKE '%' + @SearchWord + '%')
	OR c.CustomerGroupId = ISNULL(@CustomerGroupMasterId,c.CustomerGroupId)
	OR c.PostalCountryId = ISNULL(@PostalCountryId,c.PostalCountryId)
	OR c.CreatedOn = ISNULL(@CreatedOn,c.CreatedOn)
	

END
------------------------------------------------------------------------------------------------------------------
--[usp_GetCustomersBySearch] 'Red', null, null, null, null
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductsBySearch]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetProductsBySearch]
/*****************************************************************************************************************
FUNCTION:	[usp_GetProductsBySearch]
PURPOSE:	Get all products by search.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@NameSkuHandleSupplier nvarchar(200)= null,
@ProductTypeId int = null,
@ProductBrandId int = null,
@ProductSupplierId int = null,
@ProductTags nvarchar(200)= null 
)
AS
BEGIN
	
	SELECT P.ProductName, P.ProductId, P.CreatedOn, 
	PB.BrandName, PS.SupplierName, P.IsActive
	FROM Product P
	LEFT JOIN ProductBrand PB ON P.ProductBrandId = PB.ProductBrandId
	LEFT JOIN ProductSupplier PS ON P.SupplierId = PS.ProductSupplierId
	LEFT JOIN ProductTag PT ON P.ProductId = PT.ProductId
	LEFT JOIN ProductType PTy ON P.ProductTypeId = PTy.ProductTypeId
	--WHERE P.IsActive = 1
	Where @NameSkuHandleSupplier is null or P.ProductName LIKE '%' + @NameSkuHandleSupplier + '%'
	OR (@NameSkuHandleSupplier is null or P.ProductHandle LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or PS.SupplierName LIKE '%' + @NameSkuHandleSupplier + '%')
	and (@ProductTypeId IS NULL OR @ProductTypeId = P.ProductTypeId)
		and (@ProductBrandId IS NULL OR @ProductBrandId = P.ProductBrandId)
	and (@ProductSupplierId IS NULL OR @ProductSupplierId = P.SupplierId)

	--Product Tags
	--SELECT P.ProductId, PT.TagName
	--FROM Product P
	--INNER JOIN ProductTag PT ON P.ProductId = PT.ProductId
	--WHERE P.IsActive = 1



END
------------------------------------------------------------------------------------------------------------------
--usp_GetProductsBySearch 'Red', null, null, null, null
------------------------------------------------------------------------------------------------------------------


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertBrand]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertRole]
PURPOSE:	Insert a new Role.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@BrandName nvarchar(200),
@BrandDescription nvarchar(Max),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductBrand(BrandName, BrandDescription, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@BrandName, @BrandDescription, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertCustomer]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertCustomer]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertCustomer]
PURPOSE:	Insert a new Customer.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerType [CustomerType] READONLY,
@IsActive bit,
@CreatedBy int,
@CreatedOn datetime
)
AS
BEGIN

	DECLARE @CutomerTempTable [CustomerType];

	INSERT INTO @CutomerTempTable([StoreId]
           ,[FirstName]
           ,[LastName]
           ,[Company]
           ,[CustomerCode]
           ,[CustomerGroupId]
           ,[IsLoyaltyEnabled]
           ,[DateOfBirth]
           ,[Sex]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[Email]
           ,[Website]
           ,[Twitter]
           ,[IsCustomerOptedOutMail]
           ,[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddSameAsPhysicalAdd]
           ,[PostalAddressStree1]
           ,[PostalAddressStreet2]
           ,[PostalSuburb]
           ,[PostalCity]
           ,[PostalPostCode]
           ,[PostalState]
           ,[PostalCountryId])

	SELECT [StoreId]
           ,[FirstName]
           ,[LastName]
           ,[Company]
           ,[CustomerCode]
           ,[CustomerGroupId]
           ,[IsLoyaltyEnabled]
           ,[DateOfBirth]
           ,[Sex]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[Email]
           ,[Website]
           ,[Twitter]
           ,[IsCustomerOptedOutMail]
           ,[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddSameAsPhysicalAdd]
           ,[PostalAddressStree1]
           ,[PostalAddressStreet2]
           ,[PostalSuburb]
           ,[PostalCity]
           ,[PostalPostCode]
           ,[PostalState]
           ,[PostalCountryId]
		    FROM @CustomerType
	 
	INSERT INTO [dbo].[Customer]
           ([StoreId]
           ,[FirstName]
           ,[LastName]
           ,[Company]
           ,[CustomerCode]
           ,[CustomerGroupId]
           ,[IsLoyaltyEnabled]
           ,[DateOfBirth]
           ,[Sex]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[Email]
           ,[Website]
           ,[Twitter]
           ,[IsCustomerOptedOutMail]
           ,[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddSameAsPhysicalAdd]
           ,[PostalAddressStree1]
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

	 SELECT [StoreId]
           ,[FirstName]
           ,[LastName]
           ,[Company]
           ,[CustomerCode]
           ,[CustomerGroupId]
           ,[IsLoyaltyEnabled]
           ,[DateOfBirth]
           ,[Sex]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[Email]
           ,[Website]
           ,[Twitter]
           ,[IsCustomerOptedOutMail]
           ,[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddSameAsPhysicalAdd]
           ,[PostalAddressStree1]
           ,[PostalAddressStreet2]
           ,[PostalSuburb]
           ,[PostalCity]
           ,[PostalPostCode]
           ,[PostalState]
           ,[PostalCountryId]
           ,@IsActive
           ,@CreatedBy
           ,@CreatedOn
		   ,@CreatedBy
           ,@CreatedOn
            FROM @CustomerType	
	

	SELECT SCOPE_IDENTITY()

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertGroup]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertGroup]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertGroup]
PURPOSE:	Insert a new Group.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
	@GroupName nvarchar(200),
	@DiscountPercentage int,
	@CreatedBy int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CustomerGroupMaster(GroupName, DiscountPercentage, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@GroupName, @DiscountPercentage, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProduct]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProduct]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProduct]
PURPOSE:	Insert a new Product.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductName nvarchar(200),
@ProductHandle nvarchar(200),
@IsProductCanBeSold bit,
@Description nvarchar(max),
@ProductTypeId int,
@ProductBrandId int,
@SupplierId int,
@SupplierCode nvarchar(100) = NULL,
@SalesAccountCode nvarchar(40) = NULL,
@PurchaseAccountCode nvarchar(40) = NULL,
@CreatedBy int
)
AS
BEGIN
	INSERT INTO Product(ProductName, ProductHandle, IsProductCanBeSold, ProductLoyalty, Description, ProductTypeId, ProductBrandId, SupplierId,
	SupplierCode, SalesAccountCode, PurchaseAccountCode, StoreId, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductName, @ProductHandle, @IsProductCanBeSold, 0.00, @Description, @ProductTypeId, @ProductBrandId, @SupplierId, @SupplierCode,
	@SalesAccountCode, @PurchaseAccountCode, 1, @CreatedBy,
	GETDATE(), @CreatedBy, GETDATE(), 1) 	
	

	SELECT SCOPE_IDENTITY()

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductOutletPricing]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductOutletPricing]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductOutletPricing]
PURPOSE:	Insert a new Product Outlet Pricing.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductOutletPricingsList XML
)
AS
BEGIN

CREATE TABLE #ProductOutletPricingsList (ProductId BIGINT, StoreOutletId INT,SalestaxId SMALLINT, 
									TaxAmount Decimal, ProductPriceIncludingTax Decimal)
			
	-- Push Product Pricing list to temp table
	INSERT INTO #ProductOutletPricingsList 
	SELECT DISTINCT   
		ProductOutletPricingsList.ProductOutletPricing.value('ProductId[1]', 'int') as ProductId,
		ProductOutletPricingsList.ProductOutletPricing.value('StoreOutletId[1]', 'int') as StoreOutletId,
		ProductOutletPricingsList.ProductOutletPricing.value('SalestaxId[1]', 'int') as SalestaxId,
		ProductOutletPricingsList.ProductOutletPricing.value('TaxAmount[1]', 'decimal') as TaxAmount,
		ProductOutletPricingsList.ProductOutletPricing.value('ProductPriceIncludingTax[1]', 'decimal') as ProductPriceIncludingTax
	FROM @ProductOutletPricingsList.nodes('//ProductOutletPricing') ProductOutletPricingsList(ProductOutletPricing)


	IF (SELECT  COUNT(1) FROM #ProductOutletPricingsList) > 0
	BEGIN
		INSERT INTO ProductPricing(ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax,
		  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax, 
		1, GETDATE(), 1, GETDATE(), 1 FROM #ProductOutletPricingsList
	END

	DROP Table #ProductOutletPricingsList

END




GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductPricing]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductPricing]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductPricing]
PURPOSE:	Insert a new Product Pricing.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductPricingsList XML
)
AS
BEGIN

CREATE TABLE #ProductPricingsList (ProductId BIGINT, PricingTierId SMALLINT,SupplyPrice decimal, 
									MarkupPercentage Decimal, ProductPriceExcludingTax Decimal)
			
	-- Push Product Pricing list to temp table
	INSERT INTO #ProductPricingsList 
	SELECT DISTINCT   
		ProductPricingsList.ProductPricing.value('ProductId[1]', 'int') as ProductId,
		ProductPricingsList.ProductPricing.value('PricingTierId[1]', 'int') as PricingTierId,
		ProductPricingsList.ProductPricing.value('SupplyPrice[1]', 'decimal') as SupplyPrice,
		ProductPricingsList.ProductPricing.value('MarkupPercentage[1]', 'decimal') as MarkupPercentage,
		ProductPricingsList.ProductPricing.value('ProductPriceExcludingTax[1]', 'decimal') as ProductPriceExcludingTax
	FROM @ProductPricingsList.nodes('//ProductPricing') ProductPricingsList(ProductPricing)


	IF (SELECT  COUNT(1) FROM #ProductPricingsList) > 0
	BEGIN
		INSERT INTO ProductPricing(ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax,
		  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax, 
		1, GETDATE(), 1, GETDATE(), 1 FROM #ProductPricingsList
	END

	DROP Table #ProductPricingsList

END




GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductTag]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductTag]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductTag]
PURPOSE:	Insert a new Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@TagsList XML
)
AS
BEGIN

CREATE TABLE #TagsList (ProductId BIGINT, TagName nvarchar(100))
			
	-- Push Goal alignment list to temp table
	INSERT INTO #TagsList 
	SELECT DISTINCT   
		TagsList.Tag.value('ProductId[1]', 'int') as ProductId,
		TagsList.Tag.value('TagName[1]', 'nvarchar(100)') as TagName
	FROM @TagsList.nodes('//Tag') TagsList(Tag)


	IF (SELECT  COUNT(1) FROM #TagsList) > 0
	BEGIN
		INSERT INTO ProductTag(ProductId, TagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive, StoreId)
		SELECT ProductId, TagName, 1, GETDATE(), 1, GETDATE(), 1, 1 FROM #TagsList
	END

	DROP Table #TagsList

END




GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertRole]
PURPOSE:	Insert a new Role.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeName nvarchar(200),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductType(ProductTypeName, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductTypeName, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertProductVariant]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertProductVariant]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductVariant]
PURPOSE:	Insert a new Variant.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@VariantsList XML
)
AS
BEGIN

CREATE TABLE #VariantsList (ProductId BIGINT, ProductVariantAttributeId SMALLINT, VariantAttributeTagName nvarchar(200))
			
	INSERT INTO #VariantsList 
	SELECT DISTINCT   
		VariantsList.Variant.value('ProductId[1]', 'int') as ProductId,
		VariantsList.Variant.value('ProductVariantAttributeId[1]', 'int') as ProductVariantAttributeId,
		VariantsList.Variant.value('VariantAttributeTagName[1]', 'nvarchar(200)') as VariantAttributeTagName
	FROM @VariantsList.nodes('//Variant') VariantsList(Variant)


	IF (SELECT  COUNT(1) FROM #VariantsList) > 0
	BEGIN
		INSERT INTO ProductVariant(ProductId, ProductVariantAttributeId, VariantAttributeTagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive, StoreId)
		SELECT ProductId, ProductVariantAttributeId, VariantAttributeTagName, 1, GETDATE(), 1, GETDATE(), 1, 1 FROM #VariantsList
	END

	DROP Table #VariantsList

END




GO
/****** Object:  StoredProcedure [dbo].[usp_InsertSupplier]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertSupplier]
PURPOSE:	Insert a new Supplier.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@SupplierName nvarchar(200),
@SupplierDefaultMarkup decimal,
@Description nvarchar(max),
@Firstname nvarchar(100),
@Lastname nvarchar(100),
@Company nvarchar(100),
@Email nvarchar(100),
@Phone nvarchar(40),
@Mobile nvarchar(40),
@Fax nvarchar(40),
@Website nvarchar(200),
@Twitter nvarchar(200),
@AddressStreet1 nvarchar(400),
@AddressStreet2 nvarchar(400),
@Postcode nvarchar(40),
@State nvarchar(100),
@Country nvarchar(100),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductSupplier(SupplierName, SupplierDefaultMarkup, Description, Firstname, Lastname, 
	Company, Email, Phone, Mobile, Fax, Website, Twitter, AddressStreet1, AddressStreet2, Postcode, State, Country, 
	CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@SupplierName, @SupplierDefaultMarkup, @Description, @Firstname, @Lastname, @Company, @Email, @Phone,
	@Mobile, @Fax, @Website, @Twitter, @AddressStreet1, @AddressStreet2, @Postcode, @State, @Country, @CreatedBy,
	GETDATE(), @CreatedBy, GETDATE(), 1) 	
	

	SELECT SCOPE_IDENTITY()

END



GO
/****** Object:  StoredProcedure [dbo].[usp_InsertTag]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertTag]
/*****************************************************************************************************************
FUNCTION:	[uusp_InsertTag]
PURPOSE:	Insert a new Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@TagName nvarchar(200),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductTag(TagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@TagName, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBrand]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateBrand]
PURPOSE:	Update Brand.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductBrandId int,
@BrandName nvarchar(200),
@BrandDescription nvarchar(Max),
@UpdatedBy int
)
AS
BEGIN
	Update ProductBrand SET BrandName = @BrandName, BrandDescription = @BrandDescription, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductBrandId = @ProductBrandId

	SELECT @ProductBrandId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCustomer]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateCustomer]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertCustomer]
PURPOSE:	Insert a new Customer.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerType [CustomerType] READONLY,
@IsActive bit,
@UpdatedBy int,
@UpdatedOn datetime
)
AS
BEGIN

	DECLARE @CutomerTempTable [CustomerType];

	INSERT INTO @CutomerTempTable(
			[CustomerId]
			,[StoreId]
           ,[FirstName]
           ,[LastName]
           ,[Company]
           ,[CustomerCode]
           ,[CustomerGroupId]
           ,[IsLoyaltyEnabled]
           ,[DateOfBirth]
           ,[Sex]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[Email]
           ,[Website]
           ,[Twitter]
           ,[IsCustomerOptedOutMail]
           ,[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddSameAsPhysicalAdd]
           ,[PostalAddressStree1]
           ,[PostalAddressStreet2]
           ,[PostalSuburb]
           ,[PostalCity]
           ,[PostalPostCode]
           ,[PostalState]
           ,[PostalCountryId])

	SELECT  [CustomerId]
			,[StoreId]
           ,[FirstName]
           ,[LastName]
           ,[Company]
           ,[CustomerCode]
           ,[CustomerGroupId]
           ,[IsLoyaltyEnabled]
           ,[DateOfBirth]
           ,[Sex]
           ,[Phone]
           ,[Mobile]
           ,[Fax]
           ,[Email]
           ,[Website]
           ,[Twitter]
           ,[IsCustomerOptedOutMail]
           ,[PhysicalAddressStreet1]
           ,[PhysicalAddressStreet2]
           ,[PhysicalSuburb]
           ,[PhysicalCity]
           ,[PhysicalPostcode]
           ,[PhysicalState]
           ,[PhysicalCountryId]
           ,[IsPostalAddSameAsPhysicalAdd]
           ,[PostalAddressStree1]
           ,[PostalAddressStreet2]
           ,[PostalSuburb]
           ,[PostalCity]
           ,[PostalPostCode]
           ,[PostalState]
           ,[PostalCountryId]
		    FROM @CustomerType
	 
	UPDATE c SET
           c.FirstName = ct.FirstName,
		   c.LastName = ct.LastName,         				
           c.Company								  = ct.[Company]	,				
           c.CustomerCode							  = ct.[CustomerCode],				
           c.[CustomerGroupId]							  = ct.[CustomerGroupId],			
           c.[IsLoyaltyEnabled]							  = ct.[IsLoyaltyEnabled]	,		
           c.[DateOfBirth]								  = ct.[DateOfBirth]	,			
           c.[Sex]										  = ct.[Sex],						
           c.[Phone]									  = ct.[Phone]	,				
           c.[Mobile]									  = ct.[Mobile]	,				
           c.[Fax]										  = ct.[Fax]	,					
           c.[Email]									  = ct.[Email]	,				
           c.[Website]									  = ct.[Website]	,				
           c.[Twitter]									  = ct.[Twitter],					
           c.[IsCustomerOptedOutMail]					  = ct.[IsCustomerOptedOutMail]	,
           c.[PhysicalAddressStreet1]					  = ct.[PhysicalAddressStreet1]	,
           c.[PhysicalAddressStreet2]					  = ct.[PhysicalAddressStreet2]	,
           c.[PhysicalSuburb]							  = ct.[PhysicalSuburb],			
           c.[PhysicalCity]								  = ct.[PhysicalCity],				
           c.[PhysicalPostcode]							  = ct.[PhysicalPostcode]	,		
           c.[PhysicalState]							  = ct.[PhysicalState]	,		
           c.[PhysicalCountryId]						  = ct.[PhysicalCountryId]	,	
           c.[IsPostalAddSameAsPhysicalAdd]				  = ct.IsPostalAddSameAsPhysicalAdd,
           c.[PostalAddressStree1]						  = ct.[PostalAddressStree1],		
           c.[PostalAddressStreet2]						  = ct.[PostalAddressStreet2]	,	
           c.[PostalSuburb]								  = ct.[PostalSuburb],				
           c.[PostalCity]								  = ct.[PostalCity]	,			
           c.[PostalPostCode]							  = ct.[PostalPostCode]	,		
           c.[PostalState]								  = ct.[PostalState],				
           c.[PostalCountryId]							  = ct.[PostalCountryId],
		   c.[IsActive]									  = @IsActive,	
		   c.[UpdatedBy]								  =	@UpdatedBy,
		   c.[UpdatedOn]								  =	@UpdatedOn
		   FROM [dbo].Customer c 
		   JOIN @CustomerType ct ON ct.CustomerId = c.CustomerId

	

	SELECT SCOPE_IDENTITY()

END



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateGroup]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[usp_UpdateGroup]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateGroup]
PURPOSE:	Update Group.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerGroupMasterId int,
@GroupName nvarchar(200),
@DiscountPercentage int,
@UpdatedBy int
)
AS
BEGIN
	Update CustomerGroupMaster SET GroupName = @GroupName, DiscountPercentage = @DiscountPercentage, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE CustomerGroupMasterId = @CustomerGroupMasterId

	SELECT @CustomerGroupMasterId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateProductType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateProductType]
PURPOSE:	Update ProductType.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeId int,
@ProductTypeName nvarchar(200),
@UpdatedBy int
)
AS
BEGIN
	Update ProductType SET ProductTypeName = @ProductTypeName, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductTypeId = @ProductTypeId

	SELECT @ProductTypeId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSupplier]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateSupplier]
PURPOSE:	Update Supplier.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductSupplierId int,
@SupplierName nvarchar(200),
@SupplierDefaultMarkup decimal,
@Description nvarchar(max),
@Firstname nvarchar(100),
@Lastname nvarchar(100),
@Company nvarchar(100),
@Email nvarchar(100),
@Phone nvarchar(40),
@Mobile nvarchar(40),
@Fax nvarchar(40),
@Website nvarchar(200),
@Twitter nvarchar(200),
@AddressStreet1 nvarchar(400),
@AddressStreet2 nvarchar(400),
@Postcode nvarchar(40),
@State nvarchar(100),
@Country nvarchar(100),
@UpdatedBy int
)
AS
BEGIN

	Update ProductSupplier SET SupplierName = @SupplierName, SupplierDefaultMarkup = @SupplierDefaultMarkup, 
	Description = @Description, Firstname = @Firstname, Lastname = @Lastname, Company = @Company, Email = @Email,
	Phone = @Phone, Mobile = @Mobile, Fax = @Fax, Website = @Website, Twitter = @Twitter, AddressStreet1 = @AddressStreet1,
	AddressStreet2 = @AddressStreet2, Postcode = @Postcode, State = @State, Country = @Country, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductSupplierId = @ProductSupplierId


	SELECT @ProductSupplierId

END



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTag]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateTag]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateTag]
PURPOSE:	Update Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTagId int,
@TagName nvarchar(200),
@UpdatedBy int
)
AS
BEGIN
	Update ProductTag SET TagName = @TagName, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductTagId = @ProductTagId

	SELECT @ProductTagId

END



GO
/****** Object:  Table [dbo].[Address]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[AddressStreet1] [nvarchar](200) NULL,
	[AddressStreet2] [nvarchar](200) NULL,
	[Suburb] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Postcode] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AddressType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AddressType](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](100) NOT NULL,
	[CurrencySymbol] [nvarchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Company] [nvarchar](100) NULL,
	[CustomerCode] [nvarchar](100) NULL,
	[CustomerGroupId] [int] NULL,
	[IsLoyaltyEnabled] [bit] NULL,
	[DateOfBirth] [datetime] NULL,
	[Sex] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Website] [nvarchar](50) NULL,
	[Twitter] [nvarchar](50) NULL,
	[IsCustomerOptedOutMail] [bit] NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[PhysicalSuburb] [nvarchar](100) NULL,
	[PhysicalCity] [nvarchar](100) NULL,
	[PhysicalPostcode] [nvarchar](50) NULL,
	[PhysicalState] [nvarchar](50) NULL,
	[PhysicalCountryId] [int] NULL,
	[IsPostalAddSameAsPhysicalAdd] [bit] NULL,
	[PostalAddressStree1] [nvarchar](200) NULL,
	[PostalAddressStreet2] [nvarchar](200) NULL,
	[PostalSuburb] [nvarchar](100) NULL,
	[PostalCity] [nvarchar](100) NULL,
	[PostalPostCode] [nvarchar](50) NULL,
	[PostalState] [nvarchar](50) NULL,
	[PostalCountryId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[CustomerGroupId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGroupMasterId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerGroupMaster]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroupMaster](
	[CustomerGroupMasterId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[DiscountPercentage] [int] NULL,
 CONSTRAINT [PK_CustomerGroupMasterId] PRIMARY KEY CLUSTERED 
(
	[CustomerGroupMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DealnDonePlan]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealnDonePlan](
	[DealnDonePlanId] [int] IDENTITY(1,1) NOT NULL,
	[DealnDonePlanName] [nvarchar](100) NULL,
	[PlanCost] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DealnDonePlan] PRIMARY KEY CLUSTERED 
(
	[DealnDonePlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisplayPrice]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisplayPrice](
	[DisplayPriceId] [int] IDENTITY(1,1) NOT NULL,
	[DisplayPriceName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DisplayPrice] PRIMARY KEY CLUSTERED 
(
	[DisplayPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DNDUser]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DNDUser](
	[DNDUserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[PasswordSalt] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DNDUser] PRIMARY KEY CLUSTERED 
(
	[DNDUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LabelPrinterFormat]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabelPrinterFormat](
	[LabelPrinterFormatId] [int] IDENTITY(1,1) NOT NULL,
	[FormatName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_LabelPrinterFormat] PRIMARY KEY CLUSTERED 
(
	[LabelPrinterFormatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PricingTier]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricingTier](
	[PricingTierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MarkupPercentage] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PricingTier] PRIMARY KEY CLUSTERED 
(
	[PricingTierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[ProductHandle] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProductTypeId] [int] NOT NULL,
	[ProductBrandId] [int] NOT NULL,
	[SupplierId] [int] NULL,
	[SupplierCode] [nvarchar](100) NULL,
	[SalesAccountCode] [nvarchar](100) NULL,
	[PurchaseAccountCode] [nvarchar](100) NULL,
	[IsProductCanBeSold] [bit] NOT NULL,
	[ProductLoyalty] [decimal](16, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StoreId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsProductHasVariants] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductBrand]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBrand](
	[ProductBrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NULL,
	[BrandDescription] [nvarchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductBrand] PRIMARY KEY CLUSTERED 
(
	[ProductBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[IsPrimaryImage] [bit] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductInventory]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInventory](
	[ProductInventoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductVariantId] [int] NULL,
	[ProductVariantName] [nvarchar](200) NULL,
	[ProductVariantSKU] [nvarchar](50) NULL,
	[ProductVariantSupplierCode] [nvarchar](50) NULL,
	[StoreOutletId] [int] NULL,
	[StoreOutletCurrentInventory] [int] NULL,
	[StoreOutletReorderPoint] [int] NULL,
	[StoreOutletReorderAmount] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[ProductInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductOutletPricing]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOutletPricing](
	[ProductOutletPricingId] [int] NULL,
	[ProductId] [int] NULL,
	[PricingTierId] [int] NULL,
	[StoreOutletId] [int] NULL,
	[SalestaxId] [int] NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[ProductPriceIncludingTax] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductPricing]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPricing](
	[ProductPricingId] [int] NULL,
	[ProductId] [int] NULL,
	[PricingTierId] [int] NULL,
	[SupplyPrice] [decimal](18, 2) NULL,
	[MarkupPercentage] [decimal](16, 2) NULL,
	[ProductPriceExcludingTax] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductSupplier]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSupplier](
	[ProductSupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[SupplierDefaultMarkup] [decimal](18, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Website] [nvarchar](100) NULL,
	[Twitter] [nvarchar](100) NULL,
	[AddressStreet1] [nvarchar](200) NULL,
	[AddressStreet2] [nvarchar](200) NULL,
	[Postcode] [nvarchar](20) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductSupplier] PRIMARY KEY CLUSTERED 
(
	[ProductSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTag]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTag](
	[ProductTagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](100) NULL,
	[ProductId] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ProductTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductVariant]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariant](
	[ProductVariantId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductVariantAttributeId] [int] NOT NULL,
	[VariantAttributeTagName] [nvarchar](100) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductVariant] PRIMARY KEY CLUSTERED 
(
	[ProductVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductVariantAttribute]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariantAttribute](
	[ProductVariantAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[VariantAttributeName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductVariantAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductVariantAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseStockOrder]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseStockOrder](
	[PurchaseStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[OrderFromId] [int] NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[PurchaseStockOrderNumber] [nvarchar](100) NULL,
	[DeliveryToOutletId] [int] NOT NULL,
	[SupplierInvoice] [nvarchar](100) NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseStockOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisterOpenCloseStatusType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterOpenCloseStatusType](
	[RegisterOpenCloseStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[RegisterOpenCloseStatusTypeName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_RegisterOpenCloseStatusType] PRIMARY KEY CLUSTERED 
(
	[RegisterOpenCloseStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnStockOrder]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnStockOrder](
	[ReturnStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[DeliveryToSupplierId] [int] NOT NULL,
	[ReturnNumber] [nvarchar](100) NULL,
	[ReturnFromOutletId] [int] NOT NULL,
	[SupplierInvoice] [nvarchar](100) NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnStockOrder] PRIMARY KEY CLUSTERED 
(
	[ReturnStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleManagement]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleManagement](
	[RoleManagementId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_RoleManagement] PRIMARY KEY CLUSTERED 
(
	[RoleManagementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesTax]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTax](
	[SalesTaxId] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [nvarchar](100) NOT NULL,
	[TaxRate] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesTax] PRIMARY KEY CLUSTERED 
(
	[SalesTaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SellOpenCloseRegister]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellOpenCloseRegister](
	[SellOpenCloseRegisterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[LoggedInUserId] [int] NOT NULL,
	[LoggedInUserTypeId] [int] NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[StoreOutletRegisterId] [int] NOT NULL,
	[RegisterOpenCloseStatusTypeId] [int] NOT NULL,
	[RegisterOpeningDateTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SellOpenCloseRegister] PRIMARY KEY CLUSTERED 
(
	[SellOpenCloseRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupAccount]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupAccount](
	[SetupAccountId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupAccount] PRIMARY KEY CLUSTERED 
(
	[SetupAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupAccountClearOutData]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupAccountClearOutData](
	[SetupAccountClearOutDataId] [int] IDENTITY(1,1) NOT NULL,
	[SetupAccountId] [int] NOT NULL,
	[IsClearSalesHistory] [bit] NULL,
	[IsClearSalesHistoryAndProducts] [bit] NULL,
	[IsClearCustomers] [bit] NULL,
	[IsClearOutDataCompleted] [bit] NULL,
	[PlanSelectedId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupAccountClearOutData] PRIMARY KEY CLUSTERED 
(
	[SetupAccountClearOutDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupContactInformation]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupContactInformation](
	[SetupContactInformationId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[ContactFirstName] [nvarchar](100) NULL,
	[ContactLastName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Website] [nvarchar](50) NULL,
	[TwitterHandle] [nvarchar](50) NULL,
	[FaceBook] [nvarchar](50) NULL,
	[LinkedIn] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupContactInformation] PRIMARY KEY CLUSTERED 
(
	[SetupContactInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupGeneralStoreSettings]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupGeneralStoreSettings](
	[SetupGeneralStoreSettingsId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[StoreName] [nvarchar](50) NOT NULL,
	[StorePrivateURL] [nvarchar](100) NULL,
	[DefaultCurrencyId] [int] NULL,
	[TimeZoneId] [int] NULL,
	[LanguageId] [int] NULL,
	[CurrentSequenceNumber] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupGeneralStoreSettings] PRIMARY KEY CLUSTERED 
(
	[SetupGeneralStoreSettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupLoyaltyPointsId]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupLoyaltyPointsId](
	[SetupLoyaltyPointsId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[DoEnableLoyaltyPoints] [bit] NULL,
	[SpendingAmountForLoyalty] [decimal](18, 2) NULL,
	[EarningAmountForLoyalty] [decimal](18, 2) NULL,
	[DoOfferBonusLoyaltyPoints] [bit] NULL,
	[BonusLoyaltyAmount] [decimal](18, 2) NULL,
	[IsShowWelcomeEmail] [bit] NULL,
	[LoyaltyWelcomEmailSubject] [nvarchar](500) NULL,
	[LoyaltyWelcomEmailMessage] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupLoyaltyPointsId] PRIMARY KEY CLUSTERED 
(
	[SetupLoyaltyPointsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupOtherStoreSettings]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupOtherStoreSettings](
	[SetupOtherStoreSettingsId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[DisplayPricesId] [int] NULL,
	[LabelPrinterFormatId] [int] NULL,
	[SKUGenerationId] [int] NULL,
	[UserSwitchingSecurityId] [int] NULL,
	[IsDiscountAllowedOnReceipt] [bit] NULL,
	[IsOutOfStockEmailNotificationAllowed] [bit] NULL,
	[IsTipsOrSurchargeAllowed] [bit] NULL,
	[IsLaybyAllowed] [bit] NULL,
	[IsOnAccountSaleAllowed] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupOtherStoreSettings] PRIMARY KEY CLUSTERED 
(
	[SetupOtherStoreSettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupPaymentType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupPaymentType](
	[SetupPaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[PaymentTypeName] [nvarchar](100) NOT NULL,
	[PaymentTypeCustomName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupPaymentType] PRIMARY KEY CLUSTERED 
(
	[SetupPaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupRegistersAskForNote]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupRegistersAskForNote](
	[SetupRegistersAskForNoteId] [int] IDENTITY(1,1) NOT NULL,
	[AskForNoteName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersAskForNote] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersAskForNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupRegistersCashManagement]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupRegistersCashManagement](
	[SetupRegistersCashManagementId] [int] IDENTITY(1,1) NOT NULL,
	[CashManagementName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersCashManagement] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersCashManagementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupRegistersReceiptTemplate]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupRegistersReceiptTemplate](
	[SetupRegistersReceiptTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptTemplateName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersReceiptTemplate] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersReceiptTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupSalesTaxGroupId]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupSalesTaxGroupId](
	[SetupSalesTaxGroupId] [int] IDENTITY(1,1) NOT NULL,
	[SetupSalesTaxGroupMasterId] [int] NOT NULL,
	[SalesTaxId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupSalesTaxGroupId] PRIMARY KEY CLUSTERED 
(
	[SetupSalesTaxGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupSalesTaxGroupMaster]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupSalesTaxGroupMaster](
	[SetupSalesTaxGroupMasterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[TaxGroupName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupSalesTaxGroupMaster] PRIMARY KEY CLUSTERED 
(
	[SetupSalesTaxGroupMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetupStoreAddress]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupStoreAddress](
	[SetupStoreAddressId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[PhysicalSuburb] [nvarchar](50) NULL,
	[PhysicalCity] [nvarchar](50) NULL,
	[PhysicalPostcode] [nvarchar](20) NULL,
	[PhysicalState] [nvarchar](50) NULL,
	[PhysicalCountryId] [int] NULL,
	[IsPostalAddressSameAsPhysicalAddress] [bit] NULL,
	[PostalAddressStreet1] [nvarchar](200) NULL,
	[PostalAddressStreet2] [nvarchar](200) NULL,
	[PostalSuburb] [nvarchar](50) NULL,
	[PostalCity] [nvarchar](50) NULL,
	[PostalPostCode] [nvarchar](20) NULL,
	[PostalState] [nvarchar](50) NULL,
	[PostalCountryId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupStoreAddress] PRIMARY KEY CLUSTERED 
(
	[SetupStoreAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SKUGenerationType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SKUGenerationType](
	[SKUGenerationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[SKUGenerationName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SKUGenerationType] PRIMARY KEY CLUSTERED 
(
	[SKUGenerationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOrderType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOrderType](
	[StockOrderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrderTypeName] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StockOrderType] PRIMARY KEY CLUSTERED 
(
	[StockOrderTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Store]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](100) NOT NULL,
	[StoreURL] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoreOutlet]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreOutlet](
	[StoreOutletId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[OutletName] [nvarchar](100) NOT NULL,
	[OutletDefaultSalesTaxId] [int] NULL,
	[OutletOrderNumberPrefix] [nvarchar](100) NULL,
	[OutletOrderNumber] [nvarchar](100) NULL,
	[SupplierReturnPrefix] [nvarchar](100) NULL,
	[SupplierReturnNumber] [nvarchar](100) NULL,
	[IsNegativeInventory] [bit] NOT NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[Suburb] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Postcode] [nvarchar](20) NULL,
	[State] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[TimezoneId] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[TwitterHandle] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreOutlet] PRIMARY KEY CLUSTERED 
(
	[StoreOutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoreOutletRegister]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreOutletRegister](
	[StoreOutletRegisterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[RegisterName] [nvarchar](100) NOT NULL,
	[CashManagementId] [int] NULL,
	[ReceiptTemplateId] [int] NULL,
	[ReceiptNumber] [nvarchar](50) NULL,
	[ReceiptPrefix] [nvarchar](50) NULL,
	[ReceiptSufix] [nvarchar](50) NULL,
	[IsSelectUserForNextSaleAtEndOfSale] [bit] NULL,
	[DoEmailReceipt] [bit] NULL,
	[DoPrintReceipt] [nchar](10) NULL,
	[AskForNoteId] [int] NULL,
	[DoPrintNoteOnReceipt] [bit] NULL,
	[DoShowDiscountsOnReceipts] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreOutletRegister] PRIMARY KEY CLUSTERED 
(
	[StoreOutletRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoreUser]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoreUser](
	[StoreUserId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[IsAllOutletUser] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ProfileImage] [varbinary](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreUser] PRIMARY KEY CLUSTERED 
(
	[StoreUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeZone]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeZone](
	[TimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[DsiplayName] [nvarchar](100) NOT NULL,
	[StandardName] [nvarchar](100) NULL,
	[HasDST] [bit] NOT NULL,
	[UTCOffset] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_TimeZone] PRIMARY KEY CLUSTERED 
(
	[TimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransferStockOrder]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferStockOrder](
	[TransferStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[SourceOutletId] [int] NOT NULL,
	[DestinationOutletId] [int] NOT NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_TransferStockOrder] PRIMARY KEY CLUSTERED 
(
	[TransferStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserSwitchingSecurityType]    Script Date: 1/27/2018 4:48:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSwitchingSecurityType](
	[UserSwitchingSecurityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserSwitchingSecurityTypeName] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_UserSwitchingSecurityType] PRIMARY KEY CLUSTERED 
(
	[UserSwitchingSecurityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Currency] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CustomerGroup] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CustomerGroupMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DealnDonePlan] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DisplayPrice] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DNDUser] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[LabelPrinterFormat] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PricingTier] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsProductHasVariants]
GO
ALTER TABLE [dbo].[ProductBrand] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductPricing] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductSupplier] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductVariantAttribute] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PurchaseStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RegisterOpenCloseStatusType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ReturnStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RoleManagement] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SalesTax] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SellOpenCloseRegister] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupAccount] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupAccountClearOutData] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupContactInformation] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupPaymentType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupRegistersAskForNote] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupRegistersCashManagement] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupRegistersReceiptTemplate] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupMaster] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SetupStoreAddress] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SKUGenerationType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StockOrderType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Store] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StoreOutlet] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StoreOutletRegister] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StoreUser] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TimeZone] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransferStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserRole] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserSwitchingSecurityType] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_AddressType] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressType] ([AddressTypeID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_AddressType]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Country] FOREIGN KEY([PhysicalCountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Country]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Country1] FOREIGN KEY([PostalCountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Country1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroupMaster] ([CustomerGroupMasterId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerGroup]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Store]
GO
ALTER TABLE [dbo].[CustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerGroup_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerGroup] CHECK CONSTRAINT [FK_CustomerGroup_Customer]
GO
ALTER TABLE [dbo].[CustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerGroup_CustomerGroupMaster] FOREIGN KEY([CustomerGroupMasterId])
REFERENCES [dbo].[CustomerGroupMaster] ([CustomerGroupMasterId])
GO
ALTER TABLE [dbo].[CustomerGroup] CHECK CONSTRAINT [FK_CustomerGroup_CustomerGroupMaster]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductBrand] FOREIGN KEY([ProductBrandId])
REFERENCES [dbo].[ProductBrand] ([ProductBrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductBrand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSupplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[ProductSupplier] ([ProductSupplierId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductSupplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Store]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
ALTER TABLE [dbo].[ProductPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductPricing_PricingTier] FOREIGN KEY([PricingTierId])
REFERENCES [dbo].[PricingTier] ([PricingTierId])
GO
ALTER TABLE [dbo].[ProductPricing] CHECK CONSTRAINT [FK_ProductPricing_PricingTier]
GO
ALTER TABLE [dbo].[ProductPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductPricing_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductPricing] CHECK CONSTRAINT [FK_ProductPricing_Product]
GO
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Product]
GO
ALTER TABLE [dbo].[PurchaseStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO
ALTER TABLE [dbo].[PurchaseStockOrder] CHECK CONSTRAINT [FK_PurchaseStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_ProductSupplier] FOREIGN KEY([DeliveryToSupplierId])
REFERENCES [dbo].[ProductSupplier] ([ProductSupplierId])
GO
ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_ProductSupplier]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO
ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_StoreOutlet] FOREIGN KEY([ReturnFromOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_StoreOutlet]
GO
ALTER TABLE [dbo].[RoleManagement]  WITH CHECK ADD  CONSTRAINT [FK_RoleManagement_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[RoleManagement] CHECK CONSTRAINT [FK_RoleManagement_Role]
GO
ALTER TABLE [dbo].[SellOpenCloseRegister]  WITH CHECK ADD  CONSTRAINT [FK_SellOpenCloseRegister_RegisterOpenCloseStatusType] FOREIGN KEY([RegisterOpenCloseStatusTypeId])
REFERENCES [dbo].[RegisterOpenCloseStatusType] ([RegisterOpenCloseStatusTypeId])
GO
ALTER TABLE [dbo].[SellOpenCloseRegister] CHECK CONSTRAINT [FK_SellOpenCloseRegister_RegisterOpenCloseStatusType]
GO
ALTER TABLE [dbo].[SetupAccount]  WITH CHECK ADD  CONSTRAINT [FK_SetupAccount_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupAccount] CHECK CONSTRAINT [FK_SetupAccount_Store]
GO
ALTER TABLE [dbo].[SetupAccountClearOutData]  WITH CHECK ADD  CONSTRAINT [FK_SetupAccountClearOutData_SetupAccount] FOREIGN KEY([SetupAccountId])
REFERENCES [dbo].[SetupAccount] ([SetupAccountId])
GO
ALTER TABLE [dbo].[SetupAccountClearOutData] CHECK CONSTRAINT [FK_SetupAccountClearOutData_SetupAccount]
GO
ALTER TABLE [dbo].[SetupContactInformation]  WITH CHECK ADD  CONSTRAINT [FK_SetupContactInformation_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupContactInformation] CHECK CONSTRAINT [FK_SetupContactInformation_Store]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_Currency] FOREIGN KEY([DefaultCurrencyId])
REFERENCES [dbo].[Currency] ([CurrencyId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_Currency]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_Store]
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupGeneralStoreSettings_TimeZone] FOREIGN KEY([TimeZoneId])
REFERENCES [dbo].[TimeZone] ([TimeZoneId])
GO
ALTER TABLE [dbo].[SetupGeneralStoreSettings] CHECK CONSTRAINT [FK_SetupGeneralStoreSettings_TimeZone]
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId]  WITH CHECK ADD  CONSTRAINT [FK_SetupLoyaltyPointsId_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId] CHECK CONSTRAINT [FK_SetupLoyaltyPointsId_Store]
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupOtherStoreSettings_DisplayPrice] FOREIGN KEY([DisplayPricesId])
REFERENCES [dbo].[DisplayPrice] ([DisplayPriceId])
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings] CHECK CONSTRAINT [FK_SetupOtherStoreSettings_DisplayPrice]
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupOtherStoreSettings_LabelPrinterFormat] FOREIGN KEY([LabelPrinterFormatId])
REFERENCES [dbo].[LabelPrinterFormat] ([LabelPrinterFormatId])
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings] CHECK CONSTRAINT [FK_SetupOtherStoreSettings_LabelPrinterFormat]
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupOtherStoreSettings_SKUGenerationType] FOREIGN KEY([SKUGenerationId])
REFERENCES [dbo].[SKUGenerationType] ([SKUGenerationTypeId])
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings] CHECK CONSTRAINT [FK_SetupOtherStoreSettings_SKUGenerationType]
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupOtherStoreSettings_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings] CHECK CONSTRAINT [FK_SetupOtherStoreSettings_Store]
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_SetupOtherStoreSettings_UserSwitchingSecurityType] FOREIGN KEY([UserSwitchingSecurityId])
REFERENCES [dbo].[UserSwitchingSecurityType] ([UserSwitchingSecurityTypeId])
GO
ALTER TABLE [dbo].[SetupOtherStoreSettings] CHECK CONSTRAINT [FK_SetupOtherStoreSettings_UserSwitchingSecurityType]
GO
ALTER TABLE [dbo].[SetupPaymentType]  WITH CHECK ADD  CONSTRAINT [FK_SetupPaymentType_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupPaymentType] CHECK CONSTRAINT [FK_SetupPaymentType_Store]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId]  WITH CHECK ADD  CONSTRAINT [FK_SetupSalesTaxGroupId_SalesTax] FOREIGN KEY([SalesTaxId])
REFERENCES [dbo].[SalesTax] ([SalesTaxId])
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId] CHECK CONSTRAINT [FK_SetupSalesTaxGroupId_SalesTax]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId]  WITH CHECK ADD  CONSTRAINT [FK_SetupSalesTaxGroupId_SetupSalesTaxGroupMaster] FOREIGN KEY([SetupSalesTaxGroupMasterId])
REFERENCES [dbo].[SetupSalesTaxGroupMaster] ([SetupSalesTaxGroupMasterId])
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId] CHECK CONSTRAINT [FK_SetupSalesTaxGroupId_SetupSalesTaxGroupMaster]
GO
ALTER TABLE [dbo].[SetupStoreAddress]  WITH CHECK ADD  CONSTRAINT [FK_SetupStoreAddress_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[SetupStoreAddress] CHECK CONSTRAINT [FK_SetupStoreAddress_Store]
GO
ALTER TABLE [dbo].[StoreOutlet]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutlet_SalesTax] FOREIGN KEY([OutletDefaultSalesTaxId])
REFERENCES [dbo].[SalesTax] ([SalesTaxId])
GO
ALTER TABLE [dbo].[StoreOutlet] CHECK CONSTRAINT [FK_StoreOutlet_SalesTax]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersAskForNote] FOREIGN KEY([AskForNoteId])
REFERENCES [dbo].[SetupRegistersAskForNote] ([SetupRegistersAskForNoteId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersAskForNote]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersCashManagement] FOREIGN KEY([CashManagementId])
REFERENCES [dbo].[SetupRegistersCashManagement] ([SetupRegistersCashManagementId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersCashManagement]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersReceiptTemplate] FOREIGN KEY([ReceiptTemplateId])
REFERENCES [dbo].[SetupRegistersReceiptTemplate] ([SetupRegistersReceiptTemplateId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersReceiptTemplate]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_StoreOutlet]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_Role]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_Store]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_StoreOutlet]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO
ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StoreOutlet] FOREIGN KEY([SourceOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StoreOutlet]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StoreOutlet_DestinationOutletId] FOREIGN KEY([DestinationOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO
ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StoreOutlet_DestinationOutletId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_StoreUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[StoreUser] ([StoreUserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_StoreUser]
GO
USE [master]
GO
ALTER DATABASE [DND] SET  READ_WRITE 
GO
