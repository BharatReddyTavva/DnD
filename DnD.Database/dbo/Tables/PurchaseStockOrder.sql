CREATE TABLE [dbo].[PurchaseStockOrder](
	[PurchaseStockOrderId] [int] IDENTITY(1,1) NOT NULL,
	[StockOrderTypeId] [int] NOT NULL,
	[OrderName] [nvarchar](200) NOT NULL,
	[OrderFromId] [int] NOT NULL,
	[DeliveryDueDate] [datetime] NOT NULL,
	[PurchaseStockOrderNumber] [nvarchar](100) NULL,
	[DeliveryToOutletId] [int] NOT NULL,
	[SupplierInvoice] [nvarchar](100) NULL,
	[IsAutoFillFromReorderPoint] [bit] NOT NULL,
	[OrderCreatedDate] [datetime] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_PurchaseStockOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseStockOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PurchaseStockOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseStockOrder_StockOrderType] FOREIGN KEY([StockOrderTypeId])
REFERENCES [dbo].[StockOrderType] ([StockOrderTypeId])
GO

ALTER TABLE [dbo].[PurchaseStockOrder] CHECK CONSTRAINT [FK_PurchaseStockOrder_StockOrderType]
GO
ALTER TABLE [dbo].[PurchaseStockOrder] ADD  DEFAULT ((1)) FOR [IsActive]