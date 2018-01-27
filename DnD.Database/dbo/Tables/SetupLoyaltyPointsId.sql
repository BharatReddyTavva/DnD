CREATE TABLE [dbo].[SetupLoyaltyPointsId](
	[SetupLoyaltyPointsId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[DoEnableLoyaltyPoints] [bit] NULL,
	[SpendingAmountForLoyalty] [decimal](18, 2) NULL,
	[EarningAmountForLoyalty] [decimal](18, 2) NULL,
	[DoOfferBonusLoyaltyPoints] [bit] NULL,
	[BonusLoyaltyAmount] [decimal](18, 2) NULL,
	[IsShowWelcomeEmail] [bit] NULL,
	[LoyaltyWelcomEmailSubject] [nvarchar](500) NULL,
	[LoyaltyWelcomEmailMessage] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupLoyaltyPointsId] PRIMARY KEY CLUSTERED 
(
	[SetupLoyaltyPointsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId]  WITH CHECK ADD  CONSTRAINT [FK_SetupLoyaltyPointsId_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO

ALTER TABLE [dbo].[SetupLoyaltyPointsId] CHECK CONSTRAINT [FK_SetupLoyaltyPointsId_Store]
GO
ALTER TABLE [dbo].[SetupLoyaltyPointsId] ADD  DEFAULT ((1)) FOR [IsActive]