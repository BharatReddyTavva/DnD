CREATE PROCEDURE [dbo].[usp_GetStoreOutlets]
/*****************************************************************************************************************
FUNCTION:	[usp_GetStoreOutlets]
PURPOSE:	Get all outlets by store
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

	select StoreOutletId, OutletName, OutletDefaultSalesTaxId 
	from StoreOutlet where IsActive = 1
	--and StoreId = @StoreId
END
------------------------------------------------------------------------------------------------------------------
--EXEC GetStoreOutlets 1
------------------------------------------------------------------------------------------------------------------