/****** Object:  StoredProcedure [dbo].[SaveSaleTransaction_USP]    Script Date: 10/09/2015 17:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 03-10-2015
-- Description:	Save Sale transaction SP
-- =============================================
ALTER PROCEDURE [dbo].[SaveSaleTransaction_USP] --0,1,2,'10/10/2015','0','0','1',1
(
@SaleTransactionID int,
@WarehouseID int,
@MedicalShopID int,
@SellingDate nvarchar(MAX),
@SaleTransactionNo nvarchar(MAX),
@UpdatedByUserID int


)
AS
DECLARE @msg nvarchar(MAX)
BEGIN
	IF (@SaleTransactionID=0)
		BEGIN
			INSERT INTO SaleTransaction (SaleTransactionNo,WarehouseID,MedicalShopID,SellingDate,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate)
			VALUES(@SaleTransactionNo,@WarehouseID,@MedicalShopID,convert(datetime,@SellingDate,103),@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103))
			IF (@@ROWCOUNT=1)
				BEGIN
					SET @msg= (SELECT MAX(SaleTransactionID)FROM SaleTransaction)
					SELECT @msg
				END
			ELSE
				BEGIN
				    SET @msg='0'
				    SELECT @msg
				END
		END
	ELSE
		BEGIN
			UPDATE SaleTransaction SET WarehouseID=@WarehouseID,MedicalShopID=@MedicalShopID,SellingDate=convert(datetime,@SellingDate,103),SaleTransactionNo=@SaleTransactionNo,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(datetime,GETDATE(),103)
			WHERE SaleTransactionID=@SaleTransactionID
			
			IF (@@ROWCOUNT=1)
				BEGIN
					SET @msg=( SELECT SaleTransactionID FROM SaleTransaction WHERE SaleTransactionID=@SaleTransactionID)
					SELECT @msg
				END
			ELSE
				BEGIN
				    SET @msg='0'
				    SELECT @msg
				END
		END
		
	
END
