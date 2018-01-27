CREATE TABLE [dbo].[SetupSalesTaxGroupId](
	[SetupSalesTaxGroupId] [int] IDENTITY(1,1) NOT NULL,
	[SetupSalesTaxGroupMasterId] [int] NOT NULL,
	[SalesTaxId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupSalesTaxGroupId] PRIMARY KEY CLUSTERED 
(
	[SetupSalesTaxGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId]  WITH CHECK ADD  CONSTRAINT [FK_SetupSalesTaxGroupId_SalesTax] FOREIGN KEY([SalesTaxId])
REFERENCES [dbo].[SalesTax] ([SalesTaxId])
GO

ALTER TABLE [dbo].[SetupSalesTaxGroupId] CHECK CONSTRAINT [FK_SetupSalesTaxGroupId_SalesTax]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId]  WITH CHECK ADD  CONSTRAINT [FK_SetupSalesTaxGroupId_SetupSalesTaxGroupMaster] FOREIGN KEY([SetupSalesTaxGroupMasterId])
REFERENCES [dbo].[SetupSalesTaxGroupMaster] ([SetupSalesTaxGroupMasterId])
GO

ALTER TABLE [dbo].[SetupSalesTaxGroupId] CHECK CONSTRAINT [FK_SetupSalesTaxGroupId_SetupSalesTaxGroupMaster]
GO
ALTER TABLE [dbo].[SetupSalesTaxGroupId] ADD  DEFAULT ((1)) FOR [IsActive]