CREATE TABLE [dbo].[SetupContactInformation] (
    [SetupContactInformationId] INT            IDENTITY (1, 1) NOT NULL,
    [StoreId]                   INT            NOT NULL,
    [ContactFirstName]          NVARCHAR (100) NULL,
    [ContactLastName]           NVARCHAR (100) NULL,
    [Email]                     NVARCHAR (50)  NULL,
    [PhoneNumber]               NVARCHAR (20)  NULL,
    [Website]                   NVARCHAR (50)  NULL,
    [TwitterHandle]             NVARCHAR (50)  NULL,
    [FaceBook]                  NVARCHAR (50)  NULL,
    [LinkedIn]                  NVARCHAR (50)  NULL,
    [IsActive]                  BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]                 INT            NOT NULL,
    [CreatedOn]                 DATETIME       NOT NULL,
    [UpdatedBy]                 INT            NOT NULL,
    [UpdatedOn]                 DATETIME       NOT NULL,
    CONSTRAINT [PK_SetupContactInformation] PRIMARY KEY CLUSTERED ([SetupContactInformationId] ASC),
    CONSTRAINT [FK_SetupContactInformation_Store] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[Store] ([StoreId])
);


GO

GO


GO
