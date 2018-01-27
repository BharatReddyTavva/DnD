CREATE TABLE [dbo].[DiscountTypeData](
	[DiscountTypeDataId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountOfferId] [int] NOT NULL,
	[DiscountTypeId] [int] NOT NULL,
	[DiscountOfferTypeId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountTypeData] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]