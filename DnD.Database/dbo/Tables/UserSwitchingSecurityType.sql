CREATE TABLE [dbo].[UserSwitchingSecurityType](
	[UserSwitchingSecurityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserSwitchingSecurityTypeName] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_UserSwitchingSecurityType] PRIMARY KEY CLUSTERED 
(
	[UserSwitchingSecurityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserSwitchingSecurityType] ADD  DEFAULT ((1)) FOR [IsActive]