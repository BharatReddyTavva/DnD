
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