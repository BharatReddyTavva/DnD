CREATE TABLE [dbo].[DiscountOfferStoreOutlet](
	[DiscountOfferStoreOutletId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOfferId] [int] NOT NULL,
	[StoreOutletId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountOfferStoreOutlet] PRIMARY KEY CLUSTERED 
(
	[DiscountOfferStoreOutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiscountOfferStoreOutlet]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferStoreOutlet_DiscountOffer] FOREIGN KEY([DiscountOfferId])
REFERENCES [dbo].[DiscountOffer] ([DiscountOfferId])
GO

ALTER TABLE [dbo].[DiscountOfferStoreOutlet] CHECK CONSTRAINT [FK_DiscountOfferStoreOutlet_DiscountOffer]
GO
ALTER TABLE [dbo].[DiscountOfferStoreOutlet]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferStoreOutlet_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO

ALTER TABLE [dbo].[DiscountOfferStoreOutlet] CHECK CONSTRAINT [FK_DiscountOfferStoreOutlet_StoreOutlet]