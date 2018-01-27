CREATE PROCEDURE [dbo].[usp_InsertProductOutletPricing]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductOutletPricing]
PURPOSE:	Insert a new Product Outlet Pricing.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductOutletPricingsList XML
)
AS
BEGIN

CREATE TABLE #ProductOutletPricingsList (ProductId BIGINT, PricingTierId INT, StoreOutletId INT,SalestaxId SMALLINT, 
									TaxAmount Decimal, ProductPriceIncludingTax Decimal)
			
	-- Push Product Pricing list to temp table
	INSERT INTO #ProductOutletPricingsList 
	SELECT DISTINCT   
		ProductOutletPricingsList.ProductOutletPricing.value('ProductId[1]', 'int') as ProductId,
		ProductOutletPricingsList.ProductOutletPricing.value('PricingTierId[1]', 'int') as PricingTierId,
		ProductOutletPricingsList.ProductOutletPricing.value('StoreOutletId[1]', 'int') as StoreOutletId,
		ProductOutletPricingsList.ProductOutletPricing.value('SalestaxId[1]', 'int') as SalestaxId,
		ProductOutletPricingsList.ProductOutletPricing.value('TaxAmount[1]', 'decimal') as TaxAmount,
		ProductOutletPricingsList.ProductOutletPricing.value('ProductPriceIncludingTax[1]', 'decimal') as ProductPriceIncludingTax
	FROM @ProductOutletPricingsList.nodes('//ProductOutletPricing') ProductOutletPricingsList(ProductOutletPricing)


	IF (SELECT  COUNT(1) FROM #ProductOutletPricingsList) > 0
	BEGIN
		INSERT INTO ProductOutletPricing(ProductId, PricingTierId, StoreOutletId, SalestaxId, TaxAmount, ProductPriceIncludingTax,
		  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PricingTierId, StoreOutletId, SalesTaxId, TaxAmount, ProductPriceIncludingTax, 
		1, GETDATE(), 1, GETDATE(), 1 FROM #ProductOutletPricingsList
	END

	DROP Table #ProductOutletPricingsList

END