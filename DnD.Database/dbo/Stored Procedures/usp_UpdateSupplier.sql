CREATE PROCEDURE [dbo].[usp_UpdateSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_UpdateSupplier]
PURPOSE:	Update Supplier.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@ProductSupplierId int,
@SupplierName nvarchar(200),
@SupplierDefaultMarkup decimal,
@Description nvarchar(max),
@Firstname nvarchar(100),
@Lastname nvarchar(100),
@Company nvarchar(100),
@Email nvarchar(100),
@Phone nvarchar(40),
@Mobile nvarchar(40),
@Fax nvarchar(40),
@Website nvarchar(200),
@Twitter nvarchar(200),
@AddressStreet1 nvarchar(400),
@AddressStreet2 nvarchar(400),
@Postcode nvarchar(40),
@State nvarchar(100),
@Country nvarchar(100),
@UpdatedBy int
)
AS
BEGIN

	Update ProductSupplier SET SupplierName = @SupplierName, SupplierDefaultMarkup = @SupplierDefaultMarkup, 
	Description = @Description, Firstname = @Firstname, Lastname = @Lastname, Company = @Company, Email = @Email,
	Phone = @Phone, Mobile = @Mobile, Fax = @Fax, Website = @Website, Twitter = @Twitter, AddressStreet1 = @AddressStreet1,
	AddressStreet2 = @AddressStreet2, Postcode = @Postcode, State = @State, Country = @Country, UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 1
	WHERE ProductSupplierId = @ProductSupplierId


	SELECT @ProductSupplierId

END