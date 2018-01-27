CREATE PROCEDURE [dbo].[usp_UpdateTag]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateTag]
PURPOSE:	Update Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductTagMasterId int,
@TagName nvarchar(200),
@UpdatedBy int
)
AS
BEGIN
	Update ProductTagMaster SET TagName = @TagName, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductTagMasterId = @ProductTagMasterId

	SELECT @ProductTagMasterId

END