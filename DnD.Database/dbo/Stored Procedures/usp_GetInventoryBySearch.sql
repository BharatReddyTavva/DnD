CREATE PROCEDURE [dbo].[usp_GetInventoryBySearch]
/*****************************************************************************************************************
FUNCTION:	[usp_GetInventoryBySearch]
PURPOSE:	Get inventory by search.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@NameSkuHandleSupplier nvarchar(200)= null
)
AS
BEGIN
	
	SELECT DISTINCT P.ProductId, P.ProductName, P.IsProductHasVariants, PV.ProductVariantId, PV.ProductVariantName, [PI].ProductVariantSKU As ProductSKU, 
	P.IsActive
	FROM Product P
	Join ProductVariant PV On P.ProductId = PV.ProductId
	JOIN ProductInventory [PI] ON P.ProductId = [PI].ProductId and PV.ProductVariantId = [PI].ProductVariantId
	Where @NameSkuHandleSupplier is null or P.ProductName LIKE '%' + @NameSkuHandleSupplier + '%'
	OR (@NameSkuHandleSupplier is null or P.ProductHandle LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or [PI].ProductVariantSKU LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or PV.ProductVariantName LIKE '%' + @NameSkuHandleSupplier + '%')

	SELECT  PV.ProductVariantId, [PI].StoreOutletId, [PI].StoreOutletCurrentInventory, [PI].ProductVariantSupplyPrice
	FROM Product P
	Join ProductVariant PV On P.ProductId = PV.ProductId
	JOIN ProductInventory [PI] ON P.ProductId = [PI].ProductId and PV.ProductVariantId = [PI].ProductVariantId
	Where @NameSkuHandleSupplier is null or P.ProductName LIKE '%' + @NameSkuHandleSupplier + '%'
	OR (@NameSkuHandleSupplier is null or P.ProductHandle LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or [PI].ProductVariantSKU LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or PV.ProductVariantName LIKE '%' + @NameSkuHandleSupplier + '%')

END
------------------------------------------------------------------------------------------------------------------
--usp_GetInventoryBySearch 'Prod'
------------------------------------------------------------------------------------------------------------------