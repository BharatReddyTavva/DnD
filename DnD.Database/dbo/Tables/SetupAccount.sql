CREATE TABLE [dbo].[SetupAccount](
	[SetupAccountId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupAccount] PRIMARY KEY CLUSTERED 
(
	[SetupAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupAccount]  WITH CHECK ADD  CONSTRAINT [FK_SetupAccount_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO

ALTER TABLE [dbo].[SetupAccount] CHECK CONSTRAINT [FK_SetupAccount_Store]
GO
ALTER TABLE [dbo].[SetupAccount] ADD  DEFAULT ((1)) FOR [IsActive]