CREATE TABLE [dbo].[LabelPrinterFormat](
	[LabelPrinterFormatId] [int] IDENTITY(1,1) NOT NULL,
	[FormatName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_LabelPrinterFormat] PRIMARY KEY CLUSTERED 
(
	[LabelPrinterFormatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LabelPrinterFormat] ADD  DEFAULT ((1)) FOR [IsActive]