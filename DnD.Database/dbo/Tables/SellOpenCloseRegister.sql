CREATE TABLE [dbo].[SellOpenCloseRegister](
	[SellOpenCloseRegisterId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[LoggedInUserId] [int] NOT NULL,
	[LoggedInUserTypeId] [int] NOT NULL,
	[StoreOutletId] [int] NOT NULL,
	[StoreOutletRegisterId] [int] NOT NULL,
	[RegisterOpenCloseStatusTypeId] [int] NOT NULL,
	[RegisterOpeningDateTime] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SellOpenCloseRegister] PRIMARY KEY CLUSTERED 
(
	[SellOpenCloseRegisterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SellOpenCloseRegister]  WITH CHECK ADD  CONSTRAINT [FK_SellOpenCloseRegister_RegisterOpenCloseStatusType] FOREIGN KEY([RegisterOpenCloseStatusTypeId])
REFERENCES [dbo].[RegisterOpenCloseStatusType] ([RegisterOpenCloseStatusTypeId])
GO

ALTER TABLE [dbo].[SellOpenCloseRegister] CHECK CONSTRAINT [FK_SellOpenCloseRegister_RegisterOpenCloseStatusType]
GO
ALTER TABLE [dbo].[SellOpenCloseRegister] ADD  DEFAULT ((1)) FOR [IsActive]