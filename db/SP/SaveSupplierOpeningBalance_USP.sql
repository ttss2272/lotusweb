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
-- Create date: 09 OCT 2015
-- Description:	Save Opening Balance In purchaseTransaction And Purchase Transaction
-- =============================================
CREATE PROCEDURE SaveSupplierOpeningBalance_USP 
	(
	@SupplierID int,
	@OpeningBalance DECIMAL(18,2),
	@UpdatedByUserID int,
	@IsActive bit
	)
AS
DECLARE @PurchaseTransactionID int
DECLARE @OpeningBalanceRecieptNo nvarchar(50)

DECLARE @No nvarchar(50)
DECLARE @NewDate nvarchar(50)
Declare @NewPurchaseProductID int
BEGIN
	      set @no= (CONVERT(NVARCHAR(50),@SupplierID))	
			  set @no=@no+1
			  
			  set @OpeningBalanceRecieptNo= 'Sup OPBal00'+@no
			  
			  set @NewDate = Convert(nvarchar(50),getdate(),103)
			  
			  --EXEC SavePurchaseProduct_USP 0,NULL,,@SupplierID,@NewDate,NULL,@OpeningBalanceRecieptNo,@UpdatedByUserID,@IsActive
			  INSERT INTO PurchaseTransaction (SupplierID,WarehouseID,PurchaseDate,ModeOfPayment,SupplierReciptNo,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive,BalanceAmount)
			     VALUES(@SupplierID,NULL,convert(date,GETDATE(),103),NULL,@OpeningBalanceRecieptNo,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive,@OpeningBalance)
			  -- save opening balance detail in purchase transaction detail make quantity=1 and purchase rate = opening balance amount
			  IF (@@ROWCOUNT=1)
				BEGIN
				   SET @PurchaseTransactionID =(SELECT MAX (PurchaseTransactionID) FROM PurchaseTransaction)
					INSERT INTO PurchaseTransactionDetail (PurchaseTransactionID,ProductID,Quantity,PurchaseRate,BatchNo,ExpiryDate)
					VALUES (@PurchaseTransactionID,NULL,1,@OpeningBalance,NULL,CONVERT (date,GETDATE(),103))
				END
			  
			 			 
END
GO
