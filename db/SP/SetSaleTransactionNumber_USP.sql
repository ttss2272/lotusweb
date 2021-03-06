
/****** Object:  StoredProcedure [dbo].[SetSaleTransactionNumber_USP]    Script Date: 10/10/2015 13:21:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 10 oct 2015
-- Description:	Set Sale Transaction number and display on textbox
-- =============================================
ALTER PROCEDURE [dbo].[SetSaleTransactionNumber_USP]
	
AS
declare @lastSaleNo nvarchar(50)
declare @Initial nvarchar(50)='SaleNo'
Declare @Output nvarchar(50)
BEGIN
	Set @lastSaleNo=(Select MAX(SaleID) from SaleTransaction)
	
	Set @lastSaleNo= @lastSaleNo+1
	
	Set @Output= @Initial+'00'+@lastSaleNo
	
	SELECT @Output
END

