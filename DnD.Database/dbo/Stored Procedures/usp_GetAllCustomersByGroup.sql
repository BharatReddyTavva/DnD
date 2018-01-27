
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