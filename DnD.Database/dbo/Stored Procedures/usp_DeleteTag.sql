CREATE PROCEDURE [dbo].[usp_DeleteTag]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteTag]
PURPOSE:	Delete a Tag
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTagMasterId int,
@UpdatedBy int
)
AS
BEGIN

	Update  ProductTagMaster SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE ProductTagMasterId = @ProductTagMasterId

	SELECT @ProductTagMasterId

END