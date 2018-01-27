CREATE PROCEDURE [dbo].[usp_InsertBrand]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertRole]
PURPOSE:	Insert a new Role.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@BrandName nvarchar(200),
@BrandDescription nvarchar(Max),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductBrand(BrandName, BrandDescription, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@BrandName, @BrandDescription, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END