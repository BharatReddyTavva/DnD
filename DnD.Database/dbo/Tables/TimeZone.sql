CREATE TABLE [dbo].[TimeZone](
	[TimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[DsiplayName] [nvarchar](100) NOT NULL,
	[StandardName] [nvarchar](100) NULL,
	[HasDST] [bit] NOT NULL,
	[UTCOffset] [time](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_TimeZone] PRIMARY KEY CLUSTERED 
(
	[TimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TimeZone] ADD  DEFAULT ((1)) FOR [IsActive]