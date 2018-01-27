CREATE TABLE [dbo].[ProductVariantAttributeMaster](
	[ProductVariantAttributeMasterId] [int] IDENTITY(1,1) NOT NULL,
	[VariantAttributeName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductVariantAttributeMaster] PRIMARY KEY CLUSTERED 
(
	[ProductVariantAttributeMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]