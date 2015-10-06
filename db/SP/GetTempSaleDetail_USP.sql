/****** Object:  StoredProcedure [dbo].[GetTempSalesDetail_USP]    Script Date: 06/10/2015 11:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 06 Oct 2015
-- Description:	Get Temp detail for sale transaction id
-- =============================================
Create PROCEDURE [dbo].[GetTempSaleDetail_USP] 
	(
	@SaleTransactionID int
	)
AS
BEGIN
	SELECT pr.ProductName,tmp.SalePrice,tmp.Quantity From Temp_Sale tmp
	
	INNER JOIN Product pr
	ON pr.ProductID=tmp.ProductID
	
	WHERE tmp.SaleTransactionID LIKE CASE WHEN @SaleTransactionID <>0 THEN @SaleTransactionID ELSE CONVERT (nvarchar(50),tmp.SaleTransactionID)END
END
