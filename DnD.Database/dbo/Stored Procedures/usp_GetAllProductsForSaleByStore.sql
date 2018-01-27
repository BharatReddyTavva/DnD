CREATE PROCEDURE [dbo].[usp_GetAllProductsForSaleByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllProductsForSaleByStore]
PURPOSE:	Get all products of the store for sale.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int,
@OutletId int
)
AS
BEGIN
	
	select distinct P.ProductId, P.ProductName, PIM.[Image] AS ProductImage, PTY.ProductTypeId, PTY.ProductTypeName, p.IsProductHasVariants, P.CreatedOn, 
	PIN.StoreOutletCurrentInventory CurrentInventory, PIN.ProductVariantPriceExcludingTax AS Price, PIN.StoreOutletId from ProductInventory PIN
	INNER JOIN Product P On PIN.ProductId = P.ProductId
	LEFT JOIN ProductImage PIM ON P.ProductId = PIM.ProductId
	LEFT JOIN ProductType PTY ON PTY.ProductTypeId = P.ProductTypeId
	WHERE P.IsActive = 1 and PIN.StoreOutletId = @OutletId --and P.StoreId = @StoreId 

END
------------------------------------------------------------------------------------------------------------------
--usp_GetAllProductsForSaleByStore 1, 1
------------------------------------------------------------------------------------------------------------------