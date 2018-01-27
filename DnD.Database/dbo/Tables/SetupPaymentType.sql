CREATE TABLE [dbo].[SetupPaymentType](
	[SetupPaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[PaymentTypeName] [nvarchar](100) NOT NULL,
	[PaymentTypeCustomName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupPaymentType] PRIMARY KEY CLUSTERED 
(
	[SetupPaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupPaymentType]  WITH CHECK ADD  CONSTRAINT [FK_SetupPaymentType_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO

ALTER TABLE [dbo].[SetupPaymentType] CHECK CONSTRAINT [FK_SetupPaymentType_Store]
GO
ALTER TABLE [dbo].[SetupPaymentType] ADD  DEFAULT ((1)) FOR [IsActive]