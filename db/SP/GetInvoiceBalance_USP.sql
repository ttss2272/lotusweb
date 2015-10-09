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
-- Description:	Get Dupplier Invoice Toal Amount ANd balance Amount
-- =============================================
ALTER PROCEDURE GetInvoiceBalance_USP --14
	(
	@PurchaseTransactionID int = 0
	)
	
AS
BEGIN
	SELECT Convert(DECIMAL(18,2),SUM(PTD.Quantity*PTD.PurchaseRate)) AS 'Total',PT.BalanceAmount 
	FROM PurchaseTransaction PT
	
	INNER JOIN PurchaseTransactionDetail PTD
	ON PTD.PurchaseTransactionID=PT.PurchaseTransactionID
	
	WHERE PT.PurchaseTransactionID LIKE CASE WHEN @PurchaseTransactionID<>0 THEN @PurchaseTransactionID ELSE CONVERT(NVARCHAR(50),PT.PurchaseTransactionID) END
	
	GROUP BY PT.BalanceAmount
END
GO
