CREATE TABLE [dbo].[ProductPricing](
	[ProductPricingId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[PricingTierId] [int] NULL,
	[SupplyPrice] [decimal](18, 2) NULL,
	[MarkupPercentage] [decimal](16, 2) NULL,
	[ProductPriceExcludingTax] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductPricing] PRIMARY KEY CLUSTERED 
(
	[ProductPricingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductPricing_PricingTier] FOREIGN KEY([PricingTierId])
REFERENCES [dbo].[PricingTier] ([PricingTierId])
GO

ALTER TABLE [dbo].[ProductPricing] CHECK CONSTRAINT [FK_ProductPricing_PricingTier]
GO
ALTER TABLE [dbo].[ProductPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductPricing_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO

ALTER TABLE [dbo].[ProductPricing] CHECK CONSTRAINT [FK_ProductPricing_Product]