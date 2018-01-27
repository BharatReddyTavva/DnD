CREATE TABLE [dbo].[ProductVariantAttribute](
	[ProductVariantAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductVariantAttributeMasterId] [int] NOT NULL,
	[VariantAttributeTagName] [nvarchar](100) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_ProductVariantAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductVariantAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductVariantAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariantAttribute_ProductVariantAttributeMaster] FOREIGN KEY([ProductVariantAttributeMasterId])
REFERENCES [dbo].[ProductVariantAttributeMaster] ([ProductVariantAttributeMasterId])
GO

ALTER TABLE [dbo].[ProductVariantAttribute] CHECK CONSTRAINT [FK_ProductVariantAttribute_ProductVariantAttributeMaster]