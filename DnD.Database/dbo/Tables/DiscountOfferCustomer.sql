CREATE TABLE [dbo].[DiscountOfferCustomer](
	[DiscountOfferCustomerId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOfferId] [int] NOT NULL,
	[CustomerGroupId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountOfferCustomer] PRIMARY KEY CLUSTERED 
(
	[DiscountOfferCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiscountOfferCustomer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferCustomer_CustomerGroup] FOREIGN KEY([CustomerGroupId])
REFERENCES [dbo].[CustomerGroup] ([CustomerGroupId])
GO

ALTER TABLE [dbo].[DiscountOfferCustomer] CHECK CONSTRAINT [FK_DiscountOfferCustomer_CustomerGroup]
GO
ALTER TABLE [dbo].[DiscountOfferCustomer]  WITH CHECK ADD  CONSTRAINT [FK_DiscountOfferCustomer_DiscountOffer] FOREIGN KEY([DiscountOfferId])
REFERENCES [dbo].[DiscountOffer] ([DiscountOfferId])
GO

ALTER TABLE [dbo].[DiscountOfferCustomer] CHECK CONSTRAINT [FK_DiscountOfferCustomer_DiscountOffer]