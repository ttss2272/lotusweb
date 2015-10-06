USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveSaleTransaction_USP]    Script Date: 10/05/2015 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 03-10-2015
-- Description:	Save Sale transaction SP
-- =============================================
ALTER PROCEDURE [dbo].[SaveSaleTransaction_USP] 
(
@SaleTransactionID int,
@WarehouseID int,
@MedicalShopID int,
@SellingDate nvarchar(MAX),
@DiscountAmount nvarchar(MAX),
@BalanceAmount nvarchar(MAX),
@SaleTransactionNo nvarchar(MAX),
@UpdatedByUserID int


)
AS
DECLARE @msg nvarchar(MAX)
BEGIN
	IF (@SaleTransactionID=0)
		BEGIN
			INSERT INTO SaleTransaction (SaleTransactionNo,WarehouseID,MedicalShopID,SellingDate,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,DiscountAmount,BalanceAmount)
			VALUES(@SaleTransactionNo,@WarehouseID,@MedicalShopID,convert(datetime,@SellingDate,103),@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@DiscountAmount,@BalanceAmount)
			IF (@@ROWCOUNT=1)
				BEGIN
					SET @msg= (SELECT MAX(@SaleTransactionID)FROM SaleTransaction)
				END
			ELSE
				BEGIN
				    SET @msg='0'
				END
		END
	ELSE
		BEGIN
			UPDATE SaleTransaction SET WarehouseID=@WarehouseID,MedicalShopID=@MedicalShopID,SellingDate=convert(datetime,@SellingDate,103),SaleTransactionNo=@SaleTransactionNo,DiscountAmount=@DiscountAmount,BalanceAmount=@BalanceAmount,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(datetime,GETDATE(),103)
			WHERE SaleTransactionID=@SaleTransactionID
			
			IF (@@ROWCOUNT=1)
				BEGIN
					SET @msg=( SELECT SaleTransactionID FROM SaleTransaction WHERE SaleTransactionID=@SaleTransactionID)
				END
			ELSE
				BEGIN
				    SET @msg='0'
				END
		END
		
	SELECT @msg
END
