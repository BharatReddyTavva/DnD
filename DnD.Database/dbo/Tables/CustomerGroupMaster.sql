CREATE TABLE [dbo].[CustomerGroupMaster] (
    [CustomerGroupMasterId] INT            IDENTITY (1, 1) NOT NULL,
    [GroupName]             NVARCHAR (100) NULL,
    [IsActive]              BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]             INT            NOT NULL,
    [CreatedOn]             DATETIME       NOT NULL,
    [UpdatedBy]             INT            NOT NULL,
    [UpdatedOn]             DATETIME       NOT NULL,
    [DiscountPercentage]    INT            NULL,
    CONSTRAINT [PK_CustomerGroupMasterId] PRIMARY KEY CLUSTERED ([CustomerGroupMasterId] ASC)
);


GO
