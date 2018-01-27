CREATE PROCEDURE [dbo].[usp_InsertProductInventory]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductInventory]
PURPOSE:	Insert Product Inventory
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductId int,
@ProductVariantId int,
@ProductVariantSKU nvarchar(100),
@ProductVariantSupplierCode nvarchar(100),
@ProductVariantSupplyPrice decimal,
@ProductVariantMarkup decimal,
@ProductVariantRetailPrice decimal,
@StoreOutletInventoryList XML
)
AS
BEGIN


CREATE TABLE #StoreOutletInventoryList (StoreOutletId INT, StoreOutletCurrentInventory SMALLINT, StoreOutletReorderPoint INT, StoreOutletReorderAmount INT)
			
	INSERT INTO #StoreOutletInventoryList 
	SELECT DISTINCT   
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletId[1]', 'int') as StoreOutletId,
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletCurrentInventory[1]', 'int') as StoreOutletCurrentInventory,
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletReorderPoint[1]', 'int') as StoreOutletReorderPoint,
		StoreOutletInventoryList.StoreOutletInventory.value('StoreOutletReorderAmount[1]', 'int') as StoreOutletReorderAmount
	FROM @StoreOutletInventoryList.nodes('//StoreOutletInventory') StoreOutletInventoryList(StoreOutletInventory)


	IF (SELECT  COUNT(1) FROM #StoreOutletInventoryList) > 0
	BEGIN
		INSERT INTO ProductInventory(ProductId, ProductVariantId, ProductVariantSKU, ProductVariantSupplierCode, ProductVariantSupplyPrice, ProductVariantMarkupPercentage, ProductVariantPriceExcludingTax,  StoreOutletId, StoreOutletCurrentInventory,
		StoreOutletReorderPoint, StoreOutletReorderAmount, IsActive, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn)
		SELECT @ProductId, @ProductVariantId, @ProductVariantSKU, @ProductVariantSupplierCode, @ProductVariantSupplyPrice, @ProductVariantMarkup, @ProductVariantRetailPrice, StoreOutletId, StoreOutletCurrentInventory, 
		StoreOutletReorderPoint, StoreOutletReorderAmount, 1, 1, GETDATE(), 1, GETDATE() FROM #StoreOutletInventoryList
	END

	DROP Table #StoreOutletInventoryList

END