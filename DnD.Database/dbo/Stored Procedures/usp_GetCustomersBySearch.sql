
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