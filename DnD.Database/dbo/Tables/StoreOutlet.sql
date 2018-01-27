CREATE TABLE [dbo].[StoreOutlet](
	[StoreOutletId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[OutletName] [nvarchar](100) NOT NULL,
	[OutletDefaultSalesTaxId] [int] NULL,
	[OutletOrderNumberPrefix] [nvarchar](100) NULL,
	[OutletOrderNumber] [nvarchar](100) NULL,
	[SupplierReturnPrefix] [nvarchar](100) NULL,
	[SupplierReturnNumber] [nvarchar](100) NULL,
	[IsNegativeInventory] [bit] NOT NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[Suburb] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Postcode] [nvarchar](20) NULL,
	[State] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[TimezoneId] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[TwitterHandle] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreOutlet] PRIMARY KEY CLUSTERED 
(
	[StoreOutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StoreOutlet]  WITH CHECK ADD  CONSTRAINT [FK_StoreOutlet_SalesTax] FOREIGN KEY([OutletDefaultSalesTaxId])
REFERENCES [dbo].[SalesTax] ([SalesTaxId])
GO

ALTER TABLE [dbo].[StoreOutlet] CHECK CONSTRAINT [FK_StoreOutlet_SalesTax]