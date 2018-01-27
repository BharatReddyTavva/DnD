CREATE PROCEDURE [dbo].[usp_DeleteSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteSupplier]
PURPOSE:	Delete a Supplier
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductSupplierId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductSupplier SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductSupplierId = @ProductSupplierId

	SELECT @ProductSupplierId

END