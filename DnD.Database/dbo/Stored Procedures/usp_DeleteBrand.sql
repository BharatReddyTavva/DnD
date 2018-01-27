CREATE PROCEDURE [dbo].[usp_DeleteBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteBrand]
PURPOSE:	Delete a Brand
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductBrandId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductBrand SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductBrandId = @ProductBrandId

	SELECT @ProductBrandId

END