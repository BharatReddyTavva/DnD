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