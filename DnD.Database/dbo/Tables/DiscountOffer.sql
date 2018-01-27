CREATE TABLE [dbo].[DiscountOffer](
	[DiscountOfferId] [int] IDENTITY(1,1) NOT NULL,
	[OfferName] [nvarchar](100) NOT NULL,
	[OfferDisplayText] [nvarchar](400) NULL,
	[DiscountTypeId] [int] NULL,
	[DiscountOfferTypeId] [int] NULL,
	[DiscountPercentOff] [decimal](18, 0) NULL,
	[BuyUnitsToGetUnits] [int] NULL,
	[GetUnitsWhenBoughtUnits] [int] NULL,
	[BuyUnitsToGetPercentOff] [decimal](18, 0) NULL,
	[OfferValidFrom] [datetime] NULL,
	[OfferValidTo] [datetime] NULL,
	[DiscountOfferOrderAmount] [decimal](18, 0) NULL,
	[DiscountOfferDiscountPercentOnOrderAmount] [int] NULL,
 CONSTRAINT [PK_DiscountOffer] PRIMARY KEY CLUSTERED 
(
	[DiscountOfferId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiscountOffer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOffer_DiscountOfferType] FOREIGN KEY([DiscountOfferTypeId])
REFERENCES [dbo].[DiscountOfferType] ([DiscountOfferTypeId])
GO

ALTER TABLE [dbo].[DiscountOffer] CHECK CONSTRAINT [FK_DiscountOffer_DiscountOfferType]
GO
ALTER TABLE [dbo].[DiscountOffer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOffer_DiscountType] FOREIGN KEY([DiscountTypeId])
REFERENCES [dbo].[DiscountType] ([DiscountTypeId])
GO

ALTER TABLE [dbo].[DiscountOffer] CHECK CONSTRAINT [FK_DiscountOffer_DiscountType]