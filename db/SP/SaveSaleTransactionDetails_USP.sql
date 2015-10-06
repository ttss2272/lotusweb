/****** Object:  StoredProcedure [dbo].[SaveSaleTransactionDetails_USP]    Script Date: 06/10/2015 12:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SaveSaleTransactionDetails_USP]
	@SaleTansactionDetailID int,
	@SaleTansactionID int,
	@ProductID int,
	@Quantity float,
	@SellingPrice float
	
AS

declare @MedicalShopID int
BEGIN
	if(@SaleTansactionDetailID=0)
	begin
			  insert into SaleTransactionDetail (SaleTransactionID,ProductID,Quantity,SellingPrice) values(@SaleTansactionID,@ProductID,@Quantity,@SellingPrice)
			  
			
    end
		
   
   else
   begin
		update SaleTransactionDetail set SaleTransactionID= @SaleTansactionID,
		ProductID= @ProductID,Quantity=@Quantity,SellingPrice=@SellingPrice 
		where SaleTransactionID=@SaleTansactionID
	end
end
