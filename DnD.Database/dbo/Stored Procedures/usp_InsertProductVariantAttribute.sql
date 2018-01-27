CREATE PROCEDURE [dbo].[usp_InsertProductVariantAttribute]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductVariantAttribute]
PURPOSE:	Insert a Product Variant Attributes.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductVariantAttributesList XML
)
AS
BEGIN

CREATE TABLE #ProductVariantAttributesList (ProductId BIGINT, ProductVariantAttributeMasterId SMALLINT, VariantAttributeTagName nvarchar(100))
			
	INSERT INTO #ProductVariantAttributesList 
	SELECT DISTINCT   
		ProductVariantAttributesList.productVariantAttribute.value('ProductId[1]', 'int') as ProductId,
		ProductVariantAttributesList.productVariantAttribute.value('ProductVariantAttributeMasterId[1]', 'int') as ProductVariantAttributeMasterId,
		ProductVariantAttributesList.productVariantAttribute.value('VariantAttributeTagName[1]', 'nvarchar(100)') as VariantAttributeTagName
	FROM @ProductVariantAttributesList.nodes('//productVariantAttribute') ProductVariantAttributesList(productVariantAttribute)


	IF (SELECT  COUNT(1) FROM #ProductVariantAttributesList) > 0
	BEGIN
		INSERT INTO ProductVariantAttribute(ProductId, ProductVariantAttributeMasterId, VariantAttributeTagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive, StoreId)
		SELECT ProductId, ProductVariantAttributeMasterId, VariantAttributeTagName, 1, GETDATE(), 1, GETDATE(), 1, 1 FROM #ProductVariantAttributesList
	END

	DROP Table #ProductVariantAttributesList

END