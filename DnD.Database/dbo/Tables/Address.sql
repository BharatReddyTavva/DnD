CREATE TABLE [dbo].[Address] (
    [AddressID]      INT            IDENTITY (1, 1) NOT NULL,
    [AddressTypeID]  INT            NOT NULL,
    [AddressStreet1] NVARCHAR (200) NULL,
    [AddressStreet2] NVARCHAR (200) NULL,
    [Suburb]         NVARCHAR (100) NULL,
    [City]           NVARCHAR (100) NULL,
    [Postcode]       NVARCHAR (50)  NULL,
    [State]          NVARCHAR (50)  NULL,
    [CountryId]      INT            NULL,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED ([AddressID] ASC),
    CONSTRAINT [FK_Address_AddressType] FOREIGN KEY ([AddressTypeID]) REFERENCES [dbo].[AddressType] ([AddressTypeID])
);

