
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