CREATE TABLE [dbo].[SetupAccountClearOutData](
	[SetupAccountClearOutDataId] [int] IDENTITY(1,1) NOT NULL,
	[SetupAccountId] [int] NOT NULL,
	[IsClearSalesHistory] [bit] NULL,
	[IsClearSalesHistoryAndProducts] [bit] NULL,
	[IsClearCustomers] [bit] NULL,
	[IsClearOutDataCompleted] [bit] NULL,
	[PlanSelectedId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupAccountClearOutData] PRIMARY KEY CLUSTERED 
(
	[SetupAccountClearOutDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupAccountClearOutData]  WITH CHECK ADD  CONSTRAINT [FK_SetupAccountClearOutData_SetupAccount] FOREIGN KEY([SetupAccountId])
REFERENCES [dbo].[SetupAccount] ([SetupAccountId])
GO

ALTER TABLE [dbo].[SetupAccountClearOutData] CHECK CONSTRAINT [FK_SetupAccountClearOutData_SetupAccount]
GO
ALTER TABLE [dbo].[SetupAccountClearOutData] ADD  DEFAULT ((1)) FOR [IsActive]