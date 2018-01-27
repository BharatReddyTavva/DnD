CREATE PROCEDURE [dbo].[usp_InsertProductImage]
/*****************************************************************************************************************
FUNCTION:	[[usp_InsertProductImage]]
PURPOSE:	Insert a new Product Image.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductId int,
@Image varbinary(max),
@FileType nvarchar(50),
@FileName nvarchar(100)
)
AS
BEGIN
	INSERT INTO ProductImage(ProductId, IsPrimaryImage, [Image], FileType, [FileName], CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@ProductId, 1, @Image, @FileType, @FileName, 1, GETDATE(), 1, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END