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
-- Create date: 8 Oct 2015
-- Description:	Get Medical Sale Invoice No
-- =============================================
CREATE PROCEDURE GetSaleTransactionNo_USP 
	@MedicalShopID int
AS
BEGIN
	SELECT SaleTransactionID,SaleTransactionNo FROM SaleTransaction 
	WHERE MedicalShopID LIKE CASE WHEN @MedicalShopID <>0 THEN @MedicalShopID ELSE CONVERT(nvarchar(50),MedicalShopID) END
	AND BalanceAmount>0
END
GO
