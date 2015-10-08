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
-- Create date: 6  OCT 2015
-- Description:	Get PUrchase product Toal From Temp Table
-- =============================================
ALTER PROCEDURE GetTempPurchaseTotal_USP 
	(
	@PurchaseTransactionID int
	)
AS
BEGIN
	SELECT coalesce(SUM(Quantity*PurchaseRate),0) AS Total FROM Temp_Purchase
	WHERE PurchaseTransactionID=@PurchaseTransactionID
END
GO
