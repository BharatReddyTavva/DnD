CREATE TABLE [dbo].[SetupStoreAddress](
	[SetupStoreAddressId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[PhysicalAddressStreet1] [nvarchar](200) NULL,
	[PhysicalAddressStreet2] [nvarchar](200) NULL,
	[PhysicalSuburb] [nvarchar](50) NULL,
	[PhysicalCity] [nvarchar](50) NULL,
	[PhysicalPostcode] [nvarchar](20) NULL,
	[PhysicalState] [nvarchar](50) NULL,
	[PhysicalCountryId] [int] NULL,
	[IsPostalAddressSameAsPhysicalAddress] [bit] NULL,
	[PostalAddressStreet1] [nvarchar](200) NULL,
	[PostalAddressStreet2] [nvarchar](200) NULL,
	[PostalSuburb] [nvarchar](50) NULL,
	[PostalCity] [nvarchar](50) NULL,
	[PostalPostCode] [nvarchar](20) NULL,
	[PostalState] [nvarchar](50) NULL,
	[PostalCountryId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupStoreAddress] PRIMARY KEY CLUSTERED 
(
	[SetupStoreAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupStoreAddress]  WITH CHECK ADD  CONSTRAINT [FK_SetupStoreAddress_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO

ALTER TABLE [dbo].[SetupStoreAddress] CHECK CONSTRAINT [FK_SetupStoreAddress_Store]
GO
ALTER TABLE [dbo].[SetupStoreAddress] ADD  DEFAULT ((1)) FOR [IsActive]