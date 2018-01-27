CREATE TABLE [dbo].[Customer] (
    [CustomerId]                   INT            IDENTITY (1, 1) NOT NULL,
    [StoreId]                      INT            NOT NULL,
    [FirstName]                    NVARCHAR (100) NULL,
    [LastName]                     NVARCHAR (100) NULL,
    [Company]                      NVARCHAR (100) NULL,
    [CustomerCode]                 NVARCHAR (100) NULL,
    [CustomerGroupId]              INT            NULL,
    [IsLoyaltyEnabled]             BIT            NULL,
    [DateOfBirth]                  DATETIME       NULL,
    [Sex]                          NVARCHAR (10)  NULL,
    [Phone]                        NVARCHAR (20)  NULL,
    [Mobile]                       NVARCHAR (20)  NULL,
    [Fax]                          NVARCHAR (20)  NULL,
    [Email]                        NVARCHAR (50)  NULL,
    [Website]                      NVARCHAR (50)  NULL,
    [Twitter]                      NVARCHAR (50)  NULL,
    [IsCustomerOptedOutMail]       BIT            NULL,
    [PhysicalAddressStreet1]       NVARCHAR (200) NULL,
    [PhysicalAddressStreet2]       NVARCHAR (200) NULL,
    [PhysicalSuburb]               NVARCHAR (100) NULL,
    [PhysicalCity]                 NVARCHAR (100) NULL,
    [PhysicalPostcode]             NVARCHAR (50)  NULL,
    [PhysicalState]                NVARCHAR (50)  NULL,
    [PhysicalCountryId]            INT            NULL,
    [IsPostalAddSameAsPhysicalAdd] BIT            NULL,
    [PostalAddressStree1]          NVARCHAR (200) NULL,
    [PostalAddressStreet2]         NVARCHAR (200) NULL,
    [PostalSuburb]                 NVARCHAR (100) NULL,
    [PostalCity]                   NVARCHAR (100) NULL,
    [PostalPostCode]               NVARCHAR (50)  NULL,
    [PostalState]                  NVARCHAR (50)  NULL,
    [PostalCountryId]              INT            NULL,
    [IsActive]                     BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]                    INT            NOT NULL,
    [CreatedOn]                    DATETIME       NOT NULL,
    [UpdatedBy]                    INT            NOT NULL,
    [UpdatedOn]                    DATETIME       NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC),
    CONSTRAINT [FK_Customer_Country] FOREIGN KEY ([PhysicalCountryId]) REFERENCES [dbo].[Country] ([CountryId]),
    CONSTRAINT [FK_Customer_Country1] FOREIGN KEY ([PostalCountryId]) REFERENCES [dbo].[Country] ([CountryId]),
    CONSTRAINT [FK_Customer_CustomerGroup] FOREIGN KEY ([CustomerGroupId]) REFERENCES [dbo].[CustomerGroupMaster] ([CustomerGroupMasterId]),
    CONSTRAINT [FK_Customer_Store] FOREIGN KEY ([StoreId]) REFERENCES [dbo].[Store] ([StoreId])
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
