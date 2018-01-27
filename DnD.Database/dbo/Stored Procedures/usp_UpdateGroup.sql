
Create PROCEDURE [dbo].[usp_UpdateGroup]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateGroup]
PURPOSE:	Update Group.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerGroupMasterId int,
@GroupName nvarchar(200),
@DiscountPercentage int,
@UpdatedBy int
)
AS
BEGIN
	Update CustomerGroupMaster SET GroupName = @GroupName, DiscountPercentage = @DiscountPercentage, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE CustomerGroupMasterId = @CustomerGroupMasterId

	SELECT @CustomerGroupMasterId

END