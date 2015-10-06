/****** Object:  StoredProcedure [dbo].[Usp_BindData_Sales]    Script Date: 06/10/2015 12:12:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 06 Oct 2015
-- Description:	bind data from temp sale trascation table for save data in sale Transaction Deatil 
-- =============================================
Create PROCEDURE [dbo].[GetDataForSaleTransDetail_USP]
	
	@SaleTransactionID int = 0
	
AS
BEGIN
	select temp.ProductID,pro.ProductName, temp.Quantity,temp.SalePrice,temp.Discount from Temp_SaleProduct temp

Inner join Products pro
on pro.ProductID=temp.ProductID
 where SaleTansactionID=@SaleTransactionID
END