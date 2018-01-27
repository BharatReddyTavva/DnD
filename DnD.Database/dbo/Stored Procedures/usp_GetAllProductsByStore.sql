CREATE PROCEDURE [dbo].[usp_GetAllProductsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllProductsByStore]
PURPOSE:	Get all products of the store.
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
	
	SELECT DISTINCT  P.ProductId,P.ProductName, PIM.[Image], PTY.ProductTypeId, PTY.ProductTypeName, P.CreatedOn, 
	--PT.TagName, 
	PB.BrandName, PS.SupplierName, P.IsActive
	FROM Product P
	LEFT JOIN ProductBrand PB ON P.ProductBrandId = PB.ProductBrandId
	LEFT JOIN ProductSupplier PS ON P.SupplierId = PS.ProductSupplierId
	LEFT JOIN ProductTag PT ON P.ProductId = PT.ProductId
	LEFT JOIN ProductImage PIM ON P.ProductId = PIM.ProductId
	LEFT JOIN ProductType PTY ON PTY.ProductTypeId = P.ProductTypeId
	WHERE P.IsActive = 1

	--Product Tags
	SELECT P.ProductId, PTM.TagName
	FROM Product P
	INNER JOIN ProductTag PT ON P.ProductId = PT.ProductTagId
	INNER JOIN ProductTagMaster PTM ON PT.ProductTagMasterId = PTM.ProductTagMasterId
	WHERE P.IsActive = 1



END
------------------------------------------------------------------------------------------------------------------
--usp_GetAllProductsByStore 1
------------------------------------------------------------------------------------------------------------------