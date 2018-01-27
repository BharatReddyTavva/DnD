CREATE TABLE [dbo].[AddressType] (
    [AddressTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED ([AddressTypeID] ASC)
);

