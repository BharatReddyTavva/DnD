CREATE PROCEDURE [dbo].[usp_InsertProductType]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertRole]
PURPOSE:	Insert a new Role.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTypeName nvarchar(200),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductType(ProductTypeName, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductTypeName, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END