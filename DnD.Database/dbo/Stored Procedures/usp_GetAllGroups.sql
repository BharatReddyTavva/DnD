
CREATE PROCEDURE [dbo].[usp_GetAllGroups]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllGroups]
PURPOSE:	Get all groups for the customer.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
AS
BEGIN
	SELECT CustomerGroupMasterId, GroupName, DiscountPercentage, IsActive,CreatedOn
	FROM CustomerGroupMaster
	WHERE IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllGroups
------------------------------------------------------------------------------------------------------------------