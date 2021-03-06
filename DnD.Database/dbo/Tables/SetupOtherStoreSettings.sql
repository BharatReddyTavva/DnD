﻿CREATE TABLE [dbo].[SetupOtherStoreSettings] (
    [SetupOtherStoreSettingsId]            INT      IDENTITY (1, 1) NOT NULL,
    [StoreId]                              INT      NOT NULL,
    [DisplayPricesId]                      INT      NULL,
    [LabelPrinterFormatId]                 INT      NULL,
    [SKUGenerationId]                      INT      NULL,
    [UserSwitchingSecurityId]              INT      NULL,
    [IsDiscountAllowedOnReceipt]           BIT      NULL,
    [IsOutOfStockEmailNotificationAllowed] BIT      NULL,
    [IsTipsOrSurchargeAllowed]             BIT      NULL,
    [IsLaybyAllowed]                       BIT      NULL,
    [IsOnAccountSaleAllowed]               BIT      NULL,
    [IsActive]                             BIT      DEFAULT ((1)) NOT NULL,
    [CreatedBy]                            INT      NOT NULL,
    [CreatedOn]                            DATETIME NOT NULL,
    [UpdatedBy]                            INT      NOT NULL,
    [UpdatedOn]                            DATETIME NOT NULL,
    CONSTRAINT [PK_SetupOtherStoreSettings] PRIMARY KEY CLUSTERED ([SetupOtherStoreSettingsId] ASC),
    CONSTRAINT [FK_SetupOtherStoreSettings_DisplayPrice] FOREIGN KEY ([DisplayPricesId]) REFERENCES [dbo].[DisplayPrice] ([DisplayPriceId]),
    CONSTRAINT [FK_SetupOtherStoreSettings_LabelPrinterFormat] FOREIGN KEY ([LabelPrinterFormatId]) REFERENCES [dbo].[LabelPrinterFormat] ([LabelPrinterFormatId]),
    CONSTRAINT [FK_SetupOtherStoreSettings_SKUGenerationType] FOREIGN KEY ([SKUGenerationId]) REFERENCES [dbo].[SKUGenerationType] ([SKUGenerationTypeId]),
    CONSTRAINT [FK_SetupOtherStoreSettings_Store] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[Store] ([StoreId]),
    CONSTRAINT [FK_SetupOtherStoreSettings_UserSwitchingSecurityType] FOREIGN KEY ([UserSwitchingSecurityId]) REFERENCES [dbo].[UserSwitchingSecurityType] ([UserSwitchingSecurityTypeId])
);

