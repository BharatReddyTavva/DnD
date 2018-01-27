CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForCreateOrEditDiscountOffer]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditDiscountOffer]
PURPOSE:	
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

	select distinct DiscountTypeId, DiscountTypeName
	From DiscountType

	select distinct DiscountOfferTypeId, DiscountOfferTypeName 
	from DiscountOfferType

	select distinct ProductId, ProductName 
	from Product where IsActive = 1

	select Distinct ProductTagId--, TagName 
	from ProductTag where IsActive = 1 
	--and StoreId = @StoreId

	select ProductTypeId, ProductTypeName 
	from ProductType where IsActive = 1
	--and StoreId = @StoreId

	select ProductBrandId, BrandName, BrandDescription 
	from ProductBrand where IsActive = 1
	--and StoreId = @StoreId

	select StoreOutletId, OutletName 
	from StoreOutlet where IsActive = 1
	--and StoreId = @StoreId

	select distinct CustomerGroupMasterId, GroupName
	from CustomerGroupMaster
	Where IsActive = 1
	
END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForCreateOrEditDiscountOffer 1
------------------------------------------------------------------------------------------------------------------