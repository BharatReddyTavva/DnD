

CREATE PROCEDURE [dbo].[usp_DeleteCustomer]
/*****************************************************************************************************************
FUNCTION:	[usp_DeleteCustomer]
PURPOSE:	Delete a Customer
NOTES:  	
CREATED:	
REVISIONS:
Date		   Author			Description

*****************************************************************************************************************/
(
@CustomerId int,
@UpdatedBy int
)
AS
BEGIN

	Update  [dbo].[Customer] SET UpdatedBy = @UpdatedBy, UpdatedOn = GETDATE(), IsActive = 0
	WHERE CustomerId = @CustomerId

	SELECT @CustomerId

END