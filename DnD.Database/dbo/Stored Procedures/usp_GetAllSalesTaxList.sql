CREATE PROCEDURE [dbo].[usp_GetAllSalesTaxList]
/*****************************************************************************************************************
FUNCTION:	[usp_GetAllSalesTaxList]
PURPOSE:	usp_GetAllSalesTaxList.
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

	select SalesTaxId, TaxName, TaxRate 
	from SalesTax Where IsActive = 1

END
------------------------------------------------------------------------------------------------------------------
--EXEC usp_GetAllSalesTaxList 1
------------------------------------------------------------------------------------------------------------------