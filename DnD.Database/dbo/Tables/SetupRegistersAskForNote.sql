﻿CREATE TABLE [dbo].[SetupRegistersAskForNote](
	[SetupRegistersAskForNoteId] [int] IDENTITY(1,1) NOT NULL,
	[AskForNoteName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_SetupRegistersAskForNote] PRIMARY KEY CLUSTERED 
(
	[SetupRegistersAskForNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SetupRegistersAskForNote] ADD  DEFAULT ((1)) FOR [IsActive]