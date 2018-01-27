CREATE TABLE [dbo].[SetupGeneralStoreSettings] (
    [SetupGeneralStoreSettingsId] INT            IDENTITY (1, 1) NOT NULL,
    [StoreId]                     INT            NOT NULL,
    [StoreName]                   NVARCHAR (50)  NOT NULL,
    [StorePrivateURL]             NVARCHAR (100) NULL,
    [DefaultCurrencyId]           INT            NULL,
    [TimeZoneId]                  INT            NULL,
    [LanguageId]                  INT            NULL,
    [CurrentSequenceNumber]       NVARCHAR (100) NULL,
    [IsActive]                    BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]                   INT            NOT NULL,
    [CreatedOn]                   DATETIME       NOT NULL,
    [UpdatedBy]                   INT            NOT NULL,
    [UpdatedOn]                   DATETIME       NOT NULL,
    CONSTRAINT [PK_SetupGeneralStoreSettings] PRIMARY KEY CLUSTERED ([SetupGeneralStoreSettingsId] ASC),
    CONSTRAINT [FK_SetupGeneralStoreSettings_Currency] FOREIGN KEY ([DefaultCurrencyId]) REFERENCES [dbo].[Currency] ([CurrencyId]),
    CONSTRAINT [FK_SetupGeneralStoreSettings_Store] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[Store] ([StoreId]),
    CONSTRAINT [FK_SetupGeneralStoreSettings_TimeZone] FOREIGN KEY ([TimeZoneId]) REFERENCES [dbo].[TimeZone] ([TimeZoneId])
);


GO

GO


GO

GO


GO

GO


GO

GO


GO

GO


GO

GO


GO

GO


GO
