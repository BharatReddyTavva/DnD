
CREATE PROCEDURE [dbo].[usp_GetAllMasterDataForCreateOrEditCustomer]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllMasterDataForCreateOrEditCustomer]
PURPOSE:	Get Countries ,Group for customer.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
AS
BEGIN

	Select c.CountryId, c.Name as CountryName FROM [dbo].[Country] c (NOLOCK) WHERE c.IsActive = 1

	Select cg.CustomerGroupMasterId, cg.GroupName FROM [dbo].[CustomerGroupMaster] cg (NOLOCK) WHERE cg.IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllMasterDataForCreateOrEditCustomer
------------------------------------------------------------------------------------------------------------------