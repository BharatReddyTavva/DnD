CREATE PROCEDURE [dbo].[usp_InsertProduct]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProduct]
PURPOSE:	Insert a new Product.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductName nvarchar(200),
@ProductHandle nvarchar(200),
@IsProductCanBeSold bit,
@Description nvarchar(max),
@ProductTypeId int,
@ProductBrandId int,
@SupplierId int,
@SupplierCode nvarchar(100) NULL,
@SalesAccountCode nvarchar(40) NULL,
@PurchaseAccountCode nvarchar(40) NULL,
@IsProductHasVariants bit,
@CreatedBy int
)
AS
BEGIN
	INSERT INTO Product(ProductName, ProductHandle, IsProductCanBeSold, ProductLoyalty, Description, ProductTypeId, ProductBrandId, SupplierId,
	SupplierCode, SalesAccountCode, PurchaseAccountCode, IsProductHasVariants, StoreId, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductName, @ProductHandle, @IsProductCanBeSold, 0.00, @Description, @ProductTypeId, @ProductBrandId, @SupplierId, @SupplierCode,
	@SalesAccountCode, @PurchaseAccountCode, @IsProductHasVariants, 1, @CreatedBy,	GETDATE(), @CreatedBy, GETDATE(), 1) 	
	

	SELECT SCOPE_IDENTITY()

END