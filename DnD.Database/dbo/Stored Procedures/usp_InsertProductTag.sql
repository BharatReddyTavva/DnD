CREATE PROCEDURE [dbo].[usp_InsertProductTag]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertProductTag]
PURPOSE:	Insert a new Tag.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@TagsList XML
)
AS
BEGIN

CREATE TABLE #TagsList (ProductId BIGINT, ProductTagName nvarchar(100))
			
	-- Push Goal alignment list to temp table
	INSERT INTO #TagsList 
	SELECT DISTINCT   
		TagsList.Tag.value('ProductId[1]', 'int') as ProductId,
		TagsList.Tag.value('ProductTagName[1]', 'nvarchar(100)') as ProductTagName
	FROM @TagsList.nodes('//Tag') TagsList(Tag)
	
	INSERT INTO ProductTagMaster(TagName,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	SELECT ProductTagName, 1, GETDATE(), 1, GETDATE(), 1 FROM #TagsList TL 
	Where NOT EXISTS (select * FROM ProductTagMaster PTM WHERE TL.ProductTagName = PTM.TagName)

	IF (SELECT  COUNT(1) FROM #TagsList) > 0
	BEGIN
		INSERT INTO ProductTag(ProductId, ProductTagMasterId,  CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
		SELECT ProductId, PTM.ProductTagMasterId, 1, GETDATE(), 1, GETDATE(), 1 FROM #TagsList TL
		INNER JOIN ProductTagMaster PTM On TL.ProductTagName = PTM.TagName
	END

	DROP Table #TagsList

END