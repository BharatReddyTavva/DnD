CREATE TABLE [dbo].[DealnDonePlan](
	[DealnDonePlanId] [int] IDENTITY(1,1) NOT NULL,
	[DealnDonePlanName] [nvarchar](100) NULL,
	[PlanCost] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DealnDonePlan] PRIMARY KEY CLUSTERED 
(
	[DealnDonePlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DealnDonePlan] ADD  DEFAULT ((1)) FOR [IsActive]