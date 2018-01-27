CREATE TABLE [dbo].[StoreOutletRegister](
	[StoreOutletRegisterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[RegisterName] [nvarchar](100) NOT NULL,
	[CashManagementId] [int] NULL,
	[ReceiptTemplateId] [int] NULL,
	[ReceiptNumber] [nvarchar](50) NULL,
	[ReceiptPrefix] [nvarchar](50) NULL,
	[ReceiptSufix] [nvarchar](50) NULL,
	[IsSelectUserForNextSaleAtEndOfSale] [bit] NULL,
	[DoEmailReceipt] [bit] NULL,
	[DoPrintReceipt] [nchar](10) NULL,
	[AskForNoteId] [int] NULL,
	[DoPrintNoteOnReceipt] [bit] NULL,
	[DoShowDiscountsOnReceipts] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreOutletRegister] PRIMARY KEY CLUSTERED 
(
	[StoreOutletRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersAskForNote] FOREIGN KEY([AskForNoteId])
REFERENCES [dbo].[SetupRegistersAskForNote] ([SetupRegistersAskForNoteId])
GO

ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersAskForNote]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersCashManagement] FOREIGN KEY([CashManagementId])
REFERENCES [dbo].[SetupRegistersCashManagement] ([SetupRegistersCashManagementId])
GO

ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersCashManagement]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_SetupRegistersReceiptTemplate] FOREIGN KEY([ReceiptTemplateId])
REFERENCES [dbo].[SetupRegistersReceiptTemplate] ([SetupRegistersReceiptTemplateId])
GO

ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_SetupRegistersReceiptTemplate]
GO
ALTER TABLE [dbo].[StoreOutletRegister]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutletRegister_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO

ALTER TABLE [dbo].[StoreOutletRegister] CHECK CONSTRAINT [FK_StoreOutletRegister_StoreOutlet]
GO
ALTER TABLE [dbo].[StoreOutletRegister] ADD  DEFAULT ((1)) FOR [IsActive]