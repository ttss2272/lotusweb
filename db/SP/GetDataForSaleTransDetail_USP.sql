USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[GetDataForSaleTransDetail_USP]    Script Date: 10/09/2015 19:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 06 Oct 2015
-- Description:	bind data from temp sale trascation table for save data in sale Transaction Deatil 
-- =============================================
ALTER PROCEDURE [dbo].[GetDataForSaleTransDetail_USP] --0
	(
	@SaleTransactionID int = 0
	)
AS
BEGIN
	select temp.ProductID,pro.ProductName, temp.Quantity,temp.SalePrice from Temp_Sale temp

Inner join Product pro
on pro.ProductID=temp.ProductID
 where SaleTransactionID=@SaleTransactionID
END