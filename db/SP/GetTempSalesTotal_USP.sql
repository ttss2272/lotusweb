USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[GetTempSalesTotal_USP]    Script Date: 10/09/2015 18:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 9  OCT 2015
-- Description:	Get Sales product Total From Temp Table
-- =============================================
ALTER PROCEDURE [dbo].[GetTempSalesTotal_USP] 
	(
	@SaleTransactionID int
	)
AS
BEGIN
	SELECT CONVERT(decimal(18,2),coalesce(SUM(Quantity*SalePrice),0)) AS Total FROM Temp_Sale
	WHERE SaleTransactionID=@SaleTransactionID
END
