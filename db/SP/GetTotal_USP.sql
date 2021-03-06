/****** Object:  StoredProcedure [dbo].[GetTotal_USP]    Script Date: 10/10/2015 14:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 29/09/2015
-- Description:	get sale total on SaletransactionNo
-- =============================================
ALTER PROCEDURE [dbo].[GetTotal_USP] --'Lotus-Sale-0046'
@SaleTransactionID int

AS
 
BEGIN
	select CONVERT(DECIMAL(18,2),SUM(s.Quantity*s.SellingPrice)-st.DiscountAmount) as 'Total' ,st.BalanceAmount as 'BalanceAmount'from SaleTransactionDetail s 
	inner join SaleTransaction st
	on st.SaleTransactionID=s.SaleTransactionID
	
	where s.SaleTransactionID=@SaleTransactionID
	group by st.BalanceAmount,st.DiscountAmount
END