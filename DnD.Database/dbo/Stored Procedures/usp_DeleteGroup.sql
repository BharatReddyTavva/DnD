
CREATE PROCEDURE [dbo].[usp_DeleteGroup]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteGroup]
PURPOSE:	Delete a Group
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerGroupMasterId int,
@UpdatedBy int
)
AS
BEGIN

	Update  [dbo].[CustomerGroupMaster] SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE CustomerGroupMasterId = @CustomerGroupMasterId

	SELECT @CustomerGroupMasterId

END