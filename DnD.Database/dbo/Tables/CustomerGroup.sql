CREATE TABLE [dbo].[CustomerGroup](
	[CustomerGroupId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGroupMasterId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[CustomerGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerGroup_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO

ALTER TABLE [dbo].[CustomerGroup] CHECK CONSTRAINT [FK_CustomerGroup_Customer]
GO
ALTER TABLE [dbo].[CustomerGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerGroup_CustomerGroupMaster] FOREIGN KEY([CustomerGroupMasterId])
REFERENCES [dbo].[CustomerGroupMaster] ([CustomerGroupMasterId])
GO

ALTER TABLE [dbo].[CustomerGroup] CHECK CONSTRAINT [FK_CustomerGroup_CustomerGroupMaster]
GO
ALTER TABLE [dbo].[CustomerGroup] ADD  DEFAULT ((1)) FOR [IsActive]