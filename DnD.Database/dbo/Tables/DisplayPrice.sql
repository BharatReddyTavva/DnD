CREATE TABLE [dbo].[DisplayPrice](
	[DisplayPriceId] [int] IDENTITY(1,1) NOT NULL,
	[DisplayPriceName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DisplayPrice] PRIMARY KEY CLUSTERED 
(
	[DisplayPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DisplayPrice] ADD  DEFAULT ((1)) FOR [IsActive]