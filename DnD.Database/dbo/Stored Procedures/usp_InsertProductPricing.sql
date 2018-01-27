CREATE PROCEDURE [dbo].[usp_InsertProductPricing]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductPricing]
PURPOSE:	Insert a new Product Pricing.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductPricingsList XML
)
AS
BEGIN

CREATE TABLE #ProductPricingsList (ProductId BIGINT, PricingTierId SMALLINT,SupplyPrice decimal, 
									MarkupPercentage Decimal, ProductPriceExcludingTax Decimal)
			
	-- Push Product Pricing list to temp table
	INSERT INTO #ProductPricingsList 
	SELECT DISTINCT   
		ProductPricingsList.ProductPricing.value('ProductId[1]', 'int') as ProductId,
		ProductPricingsList.ProductPricing.value('PricingTierId[1]', 'int') as PricingTierId,
		ProductPricingsList.ProductPricing.value('SupplyPrice[1]', 'decimal') as SupplyPrice,
		ProductPricingsList.ProductPricing.value('MarkupPercentage[1]', 'decimal') as MarkupPercentage,
		ProductPricingsList.ProductPricing.value('ProductPriceExcludingTax[1]', 'decimal') as ProductPriceExcludingTax
	FROM @ProductPricingsList.nodes('//ProductPricing') ProductPricingsList(ProductPricing)


	IF (SELECT  COUNT(1) FROM #ProductPricingsList) > 0
	BEGIN
		INSERT INTO ProductPricing(ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax,
		  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PricingTierId, SupplyPrice, MarkupPercentage, ProductPriceExcludingTax, 
		1, GETDATE(), 1, GETDATE(), 1 FROM #ProductPricingsList
	END

	DROP Table #ProductPricingsList

END