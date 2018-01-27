CREATE TABLE [dbo].[StoreUser](
	[StoreUserId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[IsAllOutletUser] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ProfileImage] [varbinary](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StoreUser] PRIMARY KEY CLUSTERED 
(
	[StoreUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO

ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_Role]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO

ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_Store]
GO
ALTER TABLE [dbo].[StoreUser]  WITH CHECK ADD  CONSTRAINT [FK_StoreUser_StoreOutlet] FOREIGN KEY([StoreOutletId])
REFERENCES [dbo].[StoreOutlet] ([StoreOutletId])
GO

ALTER TABLE [dbo].[StoreUser] CHECK CONSTRAINT [FK_StoreUser_StoreOutlet]
GO
ALTER TABLE [dbo].[StoreUser] ADD  DEFAULT ((1)) FOR [IsActive]