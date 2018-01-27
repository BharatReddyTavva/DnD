CREATE PROCEDURE [dbo].[usp_DeleteProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteProductType]
PURPOSE:	Delete a ProductType
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductType SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductTypeId = @ProductTypeId

	SELECT @ProductTypeId

END