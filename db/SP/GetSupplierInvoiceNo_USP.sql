-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 08 Oct 2015
-- Description:	Get Supplier Invoice No
-- =============================================
AlTER PROCEDURE GetSupplierInvoiceNo_USP 
	(
	@SupplierID int
	)
AS
BEGIN
	
	SELECT PurchaseTransactionID,SupplierReciptNo from  PurchaseTransaction 
	where SupplierID LIKE CASE WHEN @SupplierID <>0 THEN @SupplierID ELSE CONVERT(nvarchar(50),SupplierID)END
	AND BalanceAmount>0
	
	ORDER BY SupplierReciptNo
END
GO
