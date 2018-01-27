CREATE PROCEDURE [dbo].[usp_UpdateProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateProductType]
PURPOSE:	Update ProductType.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeId int,
@ProductTypeName nvarchar(200),
@UpdatedBy int
)
AS
BEGIN
	Update ProductType SET ProductTypeName = @ProductTypeName, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductTypeId = @ProductTypeId

	SELECT @ProductTypeId

END