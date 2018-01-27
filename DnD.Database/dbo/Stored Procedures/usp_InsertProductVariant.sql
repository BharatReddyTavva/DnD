CREATE PROCEDURE [dbo].[usp_InsertProductVariant]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductVariant]
PURPOSE:	Insert a new Product Variant.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductId int,
@ProductVariantName nvarchar(300)
)
AS
BEGIN
	INSERT INTO ProductVariant(ProductId, ProductVariantName, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductId, @ProductVariantName, 1, GETDATE(), 1, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END