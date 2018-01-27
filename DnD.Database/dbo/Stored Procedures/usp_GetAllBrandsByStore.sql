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