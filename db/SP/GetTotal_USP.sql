/****** Object:  StoredProcedure [dbo].[Usp_GetTotal]    Script Date: 09/29/2015 12:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 29/09/2015
-- Description:	get sale total on SaletransactionNo
-- =============================================
Create PROCEDURE [dbo].[GetTotal_USP] --'Lotus-Sale-0046'
@SaleTransactionID int

AS
 
BEGIN
	select SUM(s.Quantity*s.SellingPrice)-st.DiscountAmount as 'Total' ,st.BalanceAmount as 'BalanceAmount'from SaleTransactionDetail s 
	inner join SaleTransaction st
	on st.SaleTransactionID=s.SaleTransactionID
	
	where s.SaleTransactionID=@SaleTransactionID
	group by st.BalanceAmount,st.DiscountAmount
END