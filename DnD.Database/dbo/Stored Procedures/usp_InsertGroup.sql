CREATE PROCEDURE [dbo].[usp_InsertGroup]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertGroup]
PURPOSE:	Insert a new Group.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
	@GroupName nvarchar(200),
	@DiscountPercentage int,
	@CreatedBy int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO CustomerGroupMaster(GroupName, DiscountPercentage, CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@GroupName, @DiscountPercentage, @CreatedBy, GETDATE(), @CreatedBy, GETDATE(), 1)

	SELECT SCOPE_IDENTITY()

END