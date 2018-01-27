CREATE PROCEDURE [dbo].[usp_GetAllTagsByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllTags]
PURPOSE:	Get all tags of the store.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@StoreId int
)
AS
BEGIN
	SELECT Distinct ProductTagMasterId, TagName, IsActive
	FROM ProductTagMaster
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllTagsByStore 1
------------------------------------------------------------------------------------------------------------------