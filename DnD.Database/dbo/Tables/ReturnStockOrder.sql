CREATE TABLE [dbo].[ReturnStockOrder](
	[ReturnStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[DeliveryToSupplierId] [int] NOT NULL,
	[ReturnNumber] [nvarchar](100) NULL,
	[ReturnFromOutletId] [int] NOT NULL,
	[SupplierInvoice] [nvarchar](100) NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ReturnStockOrder] PRIMARY KEY CLUSTERED 
(
	[ReturnStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_ProductSupplier] FOREIGN KEY([DeliveryToSupplierId])
REFERENCES [dbo].[ProductSupplier] ([ProductSupplierId])
GO

ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_ProductSupplier]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO

ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[ReturnStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnStockOrder_StoreOutlet] FOREIGN KEY([ReturnFromOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO

ALTER TABLE [dbo].[ReturnStockOrder] CHECK CONSTRAINT [FK_ReturnStockOrder_StoreOutlet]
GO
ALTER TABLE [dbo].[ReturnStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]