CREATE TABLE [dbo].[ProductInventory](
	[ProductInventoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductVariantId] [int] NULL,
	[ProductVariantSKU] [nvarchar](50) NULL,
	[ProductVariantSupplierCode] [nvarchar](50) NULL,
	[StoreOutletId] [int] NULL,
	[StoreOutletCurrentInventory] [int] NULL,
	[StoreOutletReorderPoint] [int] NULL,
	[StoreOutletReorderAmount] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[ProductVariantSupplyPrice] [decimal](18, 0) NULL,
	[ProductVariantMarkupPercentage] [decimal](18, 0) NULL,
	[ProductVariantPriceExcludingTax] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[ProductInventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO

ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Product]
GO
ALTER TABLE [dbo].[ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_ProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariant] ([ProductVariantId])
GO

ALTER TABLE [dbo].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_ProductVariant]