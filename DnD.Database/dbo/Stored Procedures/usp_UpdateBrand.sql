CREATE PROCEDURE [dbo].[usp_UpdateBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateBrand]
PURPOSE:	Update Brand.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductBrandId int,
@BrandName nvarchar(200),
@BrandDescription nvarchar(Max),
@UpdatedBy int
)
AS
BEGIN
	Update ProductBrand SET BrandName = @BrandName, BrandDescription = @BrandDescription, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductBrandId = @ProductBrandId

	SELECT @ProductBrandId

END