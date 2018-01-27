CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForCreateOrEditProduct]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditProduct]
PURPOSE:	Get all Product tags categories brands suppliers by store.
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

	select Distinct TagName, ProductTagMasterId
	from ProductTagMaster where IsActive = 1 
	--and StoreId = @StoreId

	select ProductTypeId, ProductTypeName 
	from ProductType where IsActive = 1
	--and StoreId = @StoreId

	select ProductBrandId, BrandName, BrandDescription 
	from ProductBrand where IsActive = 1
	--and StoreId = @StoreId

	select ProductSupplierId, SupplierName, SupplierDefaultMarkup, Description 
	from ProductSupplier where IsActive = 1
	--and StoreId = @StoreId

	select StoreOutletId, OutletName, OutletDefaultSalesTaxId 
	from StoreOutlet where IsActive = 1
	--and StoreId = @StoreId

	select ProductVariantAttributeMasterId, VariantAttributeName 
	from ProductVariantAttributeMaster
	Where IsActive = 1

	select SalesTaxId, TaxName, TaxRate 
	from SalesTax Where IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForCreateOrEditProduct 1
------------------------------------------------------------------------------------------------------------------