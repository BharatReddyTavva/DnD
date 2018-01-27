CREATE PROCEDURE [dbo].[usp_InsertSupplier]
/*****************************************************************************************************************
FUNCTION:	[usp_InsertSupplier]
PURPOSE:	Insert a new Supplier.
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@SupplierName nvarchar(200),
@SupplierDefaultMarkup decimal,
@Description nvarchar(max) = null,
@Firstname nvarchar(100),
@Lastname nvarchar(100) = null,
@Company nvarchar(100) = null,
@Email nvarchar(100) = null,
@Phone nvarchar(40) = null,
@Mobile nvarchar(40) = null,
@Fax nvarchar(40) = null,
@Website nvarchar(200) = null,
@Twitter nvarchar(200) = null,
@AddressStreet1 nvarchar(400) = null,
@AddressStreet2 nvarchar(400) = null,
@Postcode nvarchar(40) = null,
@State nvarchar(100) = null,
@Country nvarchar(100) = null,
@CreatedBy int
)
AS
BEGIN
	INSERT INTO ProductSupplier(SupplierName, SupplierDefaultMarkup, Description, Firstname, Lastname, 
	Company, Email, Phone, Mobile, Fax, Website, Twitter, AddressStreet1, AddressStreet2, Postcode, State, Country, 
	CreatedBy, CreatedOn, UpdatedBy, UpdatedOn, IsActive)
	Values (@SupplierName, @SupplierDefaultMarkup, @Description, @Firstname, @Lastname, @Company, @Email, @Phone,
	@Mobile, @Fax, @Website, @Twitter, @AddressStreet1, @AddressStreet2, @Postcode, @State, @Country, @CreatedBy,
	GETDATE(), @CreatedBy, GETDATE(), 1) 	
	

	SELECT SCOPE_IDENTITY()

END