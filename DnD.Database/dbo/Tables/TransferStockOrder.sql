CREATE TABLE [dbo].[TransferStockOrder](
	[TransferStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[SourceOutletId] [int] NOT NULL,
	[DestinationOutletId] [int] NOT NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_TransferStockOrder] PRIMARY KEY CLUSTERED 
(
	[TransferStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO

ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StoreOutlet] FOREIGN KEY([SourceOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO

ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StoreOutlet]
GO
ALTER TABLE [dbo].[TransferStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_TransferStockOrder_StoreOutlet_DestinationOutletId] FOREIGN KEY([DestinationOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO

ALTER TABLE [dbo].[TransferStockOrder] CHECK CONSTRAINT [FK_TransferStockOrder_StoreOutlet_DestinationOutletId]
GO
ALTER TABLE [dbo].[TransferStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]