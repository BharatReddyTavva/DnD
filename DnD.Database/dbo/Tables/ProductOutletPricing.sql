CREATE TABLE [dbo].[ProductOutletPricing](
	[ProductOutletPricingId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[PricingTierId] [int] NULL,
	[StoreOutletId] [int] NULL,
	[SalestaxId] [int] NULL,
	[TaxAmount] [decimal](18, 2) NULL,
	[ProductPriceIncludingTax] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductOutletPricing] PRIMARY KEY CLUSTERED 
(
	[ProductOutletPricingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOutletPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductOutletPricing_PricingTier] FOREIGN KEY([PricingTierId])
REFERENCES [dbo].[PricingTier] ([PricingTierId])
GO

ALTER TABLE [dbo].[ProductOutletPricing] CHECK CONSTRAINT [FK_ProductOutletPricing_PricingTier]
GO
ALTER TABLE [dbo].[ProductOutletPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductOutletPricing_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO

ALTER TABLE [dbo].[ProductOutletPricing] CHECK CONSTRAINT [FK_ProductOutletPricing_Product]
GO
ALTER TABLE [dbo].[ProductOutletPricing]  WITH CHECK ADD  CONSTRAINT [FK_ProductOutletPricing_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO

ALTER TABLE [dbo].[ProductOutletPricing] CHECK CONSTRAINT [FK_ProductOutletPricing_StoreOutlet]