USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveSaleTransactionDetails_USP]    Script Date: 10/10/2015 11:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 09 Oct 2015
-- Description:	Create Sales product save button Coding
-- =============================================
ALTER PROCEDURE [dbo].[SaveSaleTransactionDetails_USP] --1
(
	@SaleTansactionID int,
	@DiscountAmount decimal(18,2),
	@BalanceAmount decimal(18,2),
	@Comment nvarchar(MAX)
)	
AS

declare @msg nvarchar(MAX)
declare @Rowcnt int
BEGIN
  SET @Rowcnt=(Select Count(*) From Temp_Sale where SaleTransactionID=@SaleTansactionID) 
	
  UPDATE Product
  SET Product.SallingPrice=temp.SalePrice
  From Temp_Sale temp
  where Product.ProductID=temp.ProductID AND temp.SaleTransactionID=@SaleTansactionID
	
			  insert into SaleTransactionDetail (SaleTransactionID,ProductID,Quantity,SellingPrice) 
			  Select SaleTransactionID,ProductID,Quantity,SalePrice 
			  From Temp_Sale
			  Where SaleTransactionID=@SaleTansactionID
		IF(@@ROWCOUNT=@Rowcnt)
		   BEGIN 
		    ------Set Balance Amount of Sale Price
		    UPDATE SaleTransaction SET BalanceAmount=@BalanceAmount, DiscountAmount=@DiscountAmount,Comment=@Comment
		      where SaleTransactionID=@SaleTansactionID	  
			
				---Remove Data from Temp_Sale table
				Delete From Temp_Sale where SaleTransactionID=@SaleTansactionID
				Set @msg=(Select [Message] From [Message] Where MessageID=44)  ---------Sales Transaction Save Sucessfully msg 
				Select @msg
			
			
		End
		Else
		BEGIN
		
			SET @msg= (SELECT [Message] FROM [Message] WHERE MessageID=45) --Sales Transaction Not Saved Sucessfully msg
						SELECT @msg
			
		END
END
