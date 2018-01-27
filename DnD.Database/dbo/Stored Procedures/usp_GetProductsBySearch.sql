CREATE PROCEDURE [dbo].[usp_GetProductsBySearch]
/*****************************************************************************************************************
FUNCTION:	[usp_GetProductsBySearch]
PURPOSE:	Get all products by search.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@NameSkuHandleSupplier nvarchar(200)= null,
@ProductTypeId int = null,
@ProductBrandId int = null,
@ProductSupplierId int = null,
@ProductTags nvarchar(200)= null 
)
AS
BEGIN
	
	SELECT P.ProductName, P.ProductId, P.CreatedOn, 
	PB.BrandName, PS.SupplierName, P.IsActive
	FROM Product P
	LEFT JOIN ProductBrand PB ON P.ProductBrandId = PB.ProductBrandId
	LEFT JOIN ProductSupplier PS ON P.SupplierId = PS.ProductSupplierId
	LEFT JOIN ProductTag PT ON P.ProductId = PT.ProductId
	LEFT JOIN ProductType PTy ON P.ProductTypeId = PTy.ProductTypeId
	--WHERE P.IsActive = 1
	Where @NameSkuHandleSupplier is null or P.ProductName LIKE '%' + @NameSkuHandleSupplier + '%'
	OR (@NameSkuHandleSupplier is null or P.ProductHandle LIKE '%' + @NameSkuHandleSupplier + '%')
	OR (@NameSkuHandleSupplier is null or PS.SupplierName LIKE '%' + @NameSkuHandleSupplier + '%')
	and (@ProductTypeId IS NULL OR @ProductTypeId = P.ProductTypeId)
		and (@ProductBrandId IS NULL OR @ProductBrandId = P.ProductBrandId)
	and (@ProductSupplierId IS NULL OR @ProductSupplierId = P.SupplierId)

	--Product Tags
	--SELECT P.ProductId, PT.TagName
	--FROM Product P
	--INNER JOIN ProductTag PT ON P.ProductId = PT.ProductId
	--WHERE P.IsActive = 1



END
------------------------------------------------------------------------------------------------------------------
--usp_GetProductsBySearch 'Red', null, null, null, null
------------------------------------------------------------------------------------------------------------------