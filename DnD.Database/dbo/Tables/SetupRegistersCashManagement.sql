CREATE TABLE [dbo].[SetupRegistersCashManagement](
	[SetupRegistersCashManagementId] [int] IDENTITY(1,1) NOT NULL,
	[CashManagementName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersCashManagement] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersCashManagementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupRegistersCashManagement] ADD  DEFAULT ((1)) FOR [IsActive]