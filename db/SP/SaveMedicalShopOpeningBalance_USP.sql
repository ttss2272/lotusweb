-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 10 OCT 2015
-- Description:	Save Medical Shope Opening Balance  in Sale Transaction AND Sale Transaction Details
-- =============================================
ALTER PROCEDURE SaveMedicalShopOpeningBalance_USP 
	(
	   @MedicalShopID int,
	   @OpeningBalance DECIMAL(18,2),
		@UpdatedByUserID int
			)
AS
DECLARE @SaleTransactionID int
DECLARE @OpeningBalanceRecieptNo nvarchar(50)

DECLARE @No nvarchar(50)
DECLARE @NewDate nvarchar(50)
Declare @NewPurchaseProductID int
BEGIN
	  set @no= (CONVERT(NVARCHAR(50),@MedicalShopID))	
	      
			  --set @no=@no+1
			  
			  set @OpeningBalanceRecieptNo= 'Med OPBal00'+@no
			  
			  set @NewDate = Convert(nvarchar(50),getdate(),103)
			  
			 
			  INSERT INTO SaleTransaction (SaleTransactionNo,WarehouseID,MedicalShopID,SellingDate,DiscountAmount,BalanceAmount,CreatedByuserID,UpdatedByUserID,CreatedDate,UpdatedDate)
			     VALUES(@OpeningBalanceRecieptNo,NULL,@MedicalShopID,CONVERT(DATE,@NewDate,103),0,@OpeningBalance,@UpdatedByUserID,@UpdatedByUserID,CONVERT(DATETIME,GETDATE(),103),CONVERT(DATETIME,GETDATE(),103))
			  -- save opening balance detail in Sale transaction detail make quantity=1 and purchase rate = opening balance amount
			  IF (@@ROWCOUNT=1)
				BEGIN
				   SET @SaleTransactionID =(SELECT MAX (SaleTransactionID) FROM SaleTransaction)
					INSERT INTO SaleTransactionDetail (SaleTransactionID,ProductID,Quantity,SellingPrice)
					VALUES (@SaleTransactionID,NULL,1,@OpeningBalance)
				END

END
GO
