/****** Object:  StoredProcedure [dbo].[GetTempSalesTotal_USP]    Script Date: 10/09/2015 10:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 9  OCT 2015
-- Description:	Get Sales product Total From Temp Table
-- =============================================
Alter PROCEDURE [dbo].[GetTempSalesTotal_USP] 
	(
	@SaleTransactionID int
	)
AS
BEGIN
	SELECT coalesce(SUM(Quantity*SalePrice),0) AS Total FROM Temp_Sale
	WHERE SaleTransactionID=@SaleTransactionID
END
