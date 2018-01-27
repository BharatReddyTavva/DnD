CREATE PROCEDURE [dbo].[usp_GetAllSuppliersByStore]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllSuppliersByStore]
PURPOSE:	Get all brands of the store.
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
	SELECT ProductSupplierId, SupplierName, SupplierDefaultMarkup, Description, Firstname, Lastname, 
	Company, Email, Phone, Mobile, Fax, Website, Twitter, AddressStreet1, AddressStreet2, Postcode, State, Country, 
	CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive
	FROM ProductSupplier
	WHERE IsActive = 1
	--and StoreId = @StoreId

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllSuppliersByStore 1
------------------------------------------------------------------------------------------------------------------