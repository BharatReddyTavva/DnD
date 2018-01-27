CREATE PROCEDURE [dbo].[usp_InsertTag]
/*****************************************************************************************************************
FUNCTION:	[uusp_InsertTag]
PURPOSE:	Insert a new Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@TagName nvarchar(200),
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductTagMaster(TagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@TagName, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END