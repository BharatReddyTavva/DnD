
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